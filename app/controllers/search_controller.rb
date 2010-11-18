class SearchController < ApplicationController
  layout 'standard'
  
  def index
    @results = []

    unless params[:q]
      redirect_to :controller => 'home'
    else
      begin
        task, search = Task.parse_and_load(params[:q])
        @results = KiteParser.new(task.kite.script).send(task.name, search)
      rescue
        flash[:error] = 'Command not found.'
      end
    end
  end
end
