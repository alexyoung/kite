class Kite < ActiveRecord::Base
  acts_as_taggable
  
  has_many :tasks
  has_one :default_task, :class_name => 'Task'
end
