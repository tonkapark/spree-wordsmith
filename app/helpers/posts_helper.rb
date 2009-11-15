module PostsHelper 
  
  def safe(txt)
    sanitize(txt, :tags => %w(a b strong em i code), :attributes => %w(href)).split("\n").join("\n<br />")
  end
  
  def linked_tag_list(tags)
    tags.collect {|tag| link_to(tag.name, posts_path(:tag => tag.name))}.join(", ")
  end
  
  def post_link_list(limit = Spree::Config[:wordsmith_posts_recent])
    link = Struct.new(:name,:url)
    Post.publish.find(:all, :limit => limit).collect { |post| link.new(post.title, post_path(post)) }
  end
    
end 