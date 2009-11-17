xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "#{Spree::Config[:site_name]} #{t("comments_for")} #{@post.title}"
    xml.description "#{t("comments_for")} #{t("post")} #{@post.title}"
    xml.link comments_url(:format => 'rss')
    
    # REFACTORME some duplication with comments/index.rss.builder
    @post.comments.recent.each do |comment|
      xml.item do
        xml.title truncate(comment.body, :length => 50)
        xml.description comment.body
        xml.author comment.name
        xml.pubDate comment.created_at.to_s(:rfc822)
        xml.link post_url(:id => comment.post, :anchor => dom_id(comment))
        xml.guid({:isPermaLink => "false"}, comment_url(comment))
      end
    end
  end
end
