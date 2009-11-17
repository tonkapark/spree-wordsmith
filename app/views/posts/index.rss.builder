xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "#{Spree::Config[:site_name]}"
    xml.description "#{Spree::Config[:wordsmith_rss_description]}"
    xml.link posts_url(:format => 'rss')
    
    @posts.each do |post|
      xml.item do
        xml.title post.title
        xml.description post.body
        xml.author post.user.display_name
        xml.pubDate post.published_at.to_s(:rfc822)
        xml.link post_url(:id => post)
        xml.guid({:isPermaLink => "false"}, post_url(post))
      end
    end
  end
end
