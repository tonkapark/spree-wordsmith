module PostsHelper 
  
  def linked_tag_list(tags)
    tags.collect {|tag| link_to(tag.name, {:action => 'tags', :controller => 'posts', :id => tag.name})}.join(", ")
  end
  
  def post_link_list(limit = Spree::Config[:wordsmith_posts_recent])
    link = Struct.new(:name,:url)
    Post.publish.find(:all, :limit => limit).collect { |post| link.new(post.title, post_path(post)) }
  end
    
end 