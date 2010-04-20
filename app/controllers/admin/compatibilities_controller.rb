class Admin::CompatibilitiesController < Admin::BaseController
  resource_controller
  belongs_to :product
  
  new_action.wants.html { render :action => :new, :layout => false }
  show.wants.html { redirect_to :action => :index }
  
  def collection
    @collection ||= end_of_association_chain.all
  end
end
