class Admin::PagesController < Admin::BaseController
  resource_controller
  
  def new
    @page = Page.new(:user_id => current_user.id)    
    @page.is_active = Spree::Config[:wordsmith_page_status_default]
    @page.commentable = Spree::Config[:wordsmith_page_comment_default]
    
    respond_to do |format|
      format.html
    end
  end  
  
  update.response do |wants|
    wants.html { redirect_to collection_url }
  end

  create.response do |wants|
    wants.html { redirect_to collection_url }
  end
    
end
