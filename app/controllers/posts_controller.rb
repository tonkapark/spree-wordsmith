class PostsController < Spree::BaseController  

  resource_controller
  actions :show, :index

private
  def collection
    @collection ||= end_of_association_chain.publish.paginate :page => params[:page]
  end

end 