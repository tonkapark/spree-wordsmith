xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "#{Spree::Config[:site_name]} Comments"
    xml.description "#{t("recent")} #{t("comments_for")} #{Spree::Config[:site_name]}"
    xml.link comments_url(:format => 'rss')
    
    @comments.each do |comment|
      xml.item do
        xml.title "Comment for post #{comment.post.title}"
        xml.description comment.body
        xml.author comment.name
        xml.pubDate comment.created_at.to_s(:rfc822)
        xml.link post_url(:id => comment.post, :anchor => dom_id(comment))
        xml.guid({:isPermaLink => "false"}, comment_url(comment))
      end
    end
  end
end
