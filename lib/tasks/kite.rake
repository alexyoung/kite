require RAILS_ROOT + '/config/environment'

namespace :kite do
  desc 'Imports all standard kites'
  task :import do
    Dir.glob(RAILS_ROOT + '/lib/kites/*.kite').each do |file_name|
      p "Importing #{file_name}"

      script = File.open(file_name).read
      k = KiteParser.new(script)
      
      kite = if kite = Kite.find_by_name_and_namespace(k._name, 'System')
        kite.update_attributes(:name => k._name,
        :namespace => 'System',
        :script => script,
        :description => k._description)
        kite
      else
        Kite.create(
          :name => k._name,
          :namespace => 'System',
          :script => script,
          :description => k._description)
      end
      
      kite.write_tags k._tags
      
      k.tasks.each do |name, t|
        name = name.to_s

        next if t[:private]

        task = if task = Task.find_by_name_and_kite_id(name, kite.id)
          task.update_attributes(:kite => kite, :name => name)
          task
        else
          Task.create(:kite => kite, :name => name)
        end

        if task.name == k._default.to_s
          kite.update_attribute(:default_task_id, task.id)
        end
      end
    end
  end
end