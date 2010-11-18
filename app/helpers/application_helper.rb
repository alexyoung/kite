# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def top_tasks
    Task.find(:all, :limit => 5).collect { |task| "#{task.kite.name} #{task.name}" }.join(', ')
  end
end
