class Post < WsItem

  validates_presence_of :body, :message => 'required'
  
  cattr_reader :per_page
  @@per_page = Spree::Config[:wordsmith_posts_per_page]
    
end
