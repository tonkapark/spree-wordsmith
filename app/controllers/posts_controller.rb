class PostsController < Spree::BaseController  

  resource_controller
  actions :show, :index

  index.response do |wants|
    wants.html
    wants.rss
  end
    
  show.response do |wants|
    wants.html
  end
    
  def tags
      @posts = Post.publish.find_all_tagged_with(params[:tag_name]).paginate :page => params[:page]    
  end
    
private
  def collection
    @collection ||= end_of_association_chain.publish.paginate :page => params[:page]
  end
  
  def object
    @object ||= end_of_association_chain.publish.find(param) unless param.nil?
    @object
  end
  

end 