class Admin::PostsController < Admin::BaseController
  resource_controller :except => [:show]

  def new
    @post = Post.new(:user_id => current_user.id)    
    @post.is_active = Spree::Config[:wordsmith_post_status_default]
    @post.commentable = Spree::Config[:wordsmith_post_comment_default]
    
    respond_to do |format|
      format.html
    end
  end

  def edit
    @post = Post.find(params[:id])
  end


  create.wants.html {redirect_to admin_posts_path}
  update.wants.html {redirect_to admin_posts_path}
end 