class CommentsController < Spree::BaseController  
  
  def index
    @comments = Comment.recent.all(:limit => 30)
    respond_to do |format|
      format.html
      format.rss
    end
  end
  
  def new
    flash[:notice] = "To submit a comment, please go to a specific post first."
    redirect_to root_url
  end
  
  def create
    @comment = Comment.new(params[:comment])
    @comment.request = request
    if params[:preview_button].nil? && @comment.save
      flash[:notice] = "Successfully created comment."
      redirect_to post_path(@comment.post, :anchor => dom_id(@comment))
    else
      render 'new'
    end
  end
  
  def edit
    @comment = Comment.find(params[:id])
  end
  
  def update
    @comment = Comment.find(params[:id])
    if @comment.update_attributes(params[:comment])
      flash[:notice] = "Successfully updated comment."
      redirect_to @comment.post
    else
      render 'edit'
    end
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:notice] = "Successfully destroyed comment."
    respond_to do |format|
      format.html { redirect_to comments_path }
      format.js
    end
  end
end