class Mailer < ActionMailer::Base

  def comment_notify(comment)
    subject    "A comment has been added at #{Spree::Config[:site_name]}"
    recipients comment.post.user.email
    from       Spree::Config[:wordsmith_mailer_from]    
    body       :greeting => 'Hi,', :comment => comment
    @content_type = "text/html"
  end

end
