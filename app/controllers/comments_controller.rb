class CommentsController < Spree::BaseController  
  resource_controller  
  belongs_to :post
  
  create.wants.html {redirect_to @post}
  update.wants.html {redirect_to @post}
  update.wants.html {redirect_to @post}
  
end