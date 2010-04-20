class Admin::MarkaModelsController < Admin::BaseController
  resource_controller
  
  new_action.response do |wants|
    wants.html {render :action => :new, :layout => false}
  end
  
  show.wants.html { redirect_to :action => :index }
  
  def collection
    @collection ||= end_of_association_chain.all
  end
end
