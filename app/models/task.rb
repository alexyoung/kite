class Task < ActiveRecord::Base
  belongs_to :kite
  
  def self.parse_and_load(query)
    invoker = query.split(' ').first.strip
    task_name = query.split(' ')[1].strip
    query = query.gsub(invoker, '').gsub(task_name, '').strip

    if kite = Kite.find_by_name_and_namespace(invoker, 'System')
      task = Task.find_by_name_and_kite_id(task_name, kite.id)
      task = kite.default_task unless task
      return [task, query]
    elsif task = Task.find_by_name(invoker)
      return [task, query]
    else
      return nil
    end
  end
end