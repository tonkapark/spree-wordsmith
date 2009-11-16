class CommentsController < Spree::BaseController  
  resource_controller   
  belongs_to :post
  actions :new, :create
  
  create.wants.html { redirect_to @post}

end