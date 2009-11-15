class Comment < ActiveRecord::Base
  attr_accessible :body, :name, :email, :url
  
  belongs_to :user
  belongs_to :post, :counter_cache => true
  
  before_validation :downcase_email
  after_create :notify_author
  
  validates_presence_of :name, :email, :body
  validates_length_of       :email,    :within => 6..200
  validates_format_of       :email, :with => /(^([^@\s]+)@((?:[-_a-z0-9]+\.)+[a-z]{2,})$)|(^$)/i
  
  protected
  
  def notify_author     
      Mailer.deliver_comment_notify(self) unless self.email == self.post.user.email
  end
    
  def downcase_email
    self.email = email.to_s.downcase
  end  
end
