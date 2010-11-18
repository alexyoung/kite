class CreateKites < ActiveRecord::Migration
  def self.up
    create_table :kites do |t|
      t.column :name, :string
      t.column :namespace, :string
      t.column :script, :text
      t.column :default_task_id, :integer
      t.column :description, :text
      t.column :created_at, :datetime
      t.column :updated_at, :datetime
    end
  end

  def self.down
    drop_table :kites
  end
end
