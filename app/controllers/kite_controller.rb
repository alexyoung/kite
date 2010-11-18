class KiteController < ApplicationController
  layout 'standard'
  
  def index
    @kites = Kite.find(:all, :order => 'namespace, name')
  end
  
  def view
    @kite = Kite.find_by_name_and_namespace(params[:name], 'System')
  end
  
  def by_tag
    @kites = Kite.find_tagged_with(params[:tag])
  end
end
