class Comment < ActiveRecord::Base
  attr_accessible :body, :name, :email, :url, :post_id
  
  belongs_to :user
  belongs_to :post, :counter_cache => true
  
  before_validation :downcase_email
  before_save :add_protocol_to_url
  after_create :notify_author
  
  validates_presence_of :name, :post_id, :body
  validates_length_of       :email,    :maximum => 200
  validates_format_of       :email, :with => /(^([^@\s]+)@((?:[-_a-z0-9]+\.)+[a-z]{2,})$)|(^$)/i
  
  named_scope :recent, :order => "created_at DESC"
  
  def request=(request)
    self.user_ip    = request.remote_ip
    self.user_agent = request.env['HTTP_USER_AGENT']
    self.referrer   = request.env['HTTP_REFERER']
  end  
  
  protected
  
  def notify_author     
      Mailer.deliver_comment_notify(self) unless self.email == self.post.user.email
  end
    
  def downcase_email
    self.email = email.to_s.downcase
  end  
  
  private
  
  def add_protocol_to_url
    self.url = "http://#{url}" unless url.blank? || url.include?('://')
  end
  
end
