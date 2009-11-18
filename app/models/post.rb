class Post < ActiveRecord::Base
  attr_accessible :user_id, :title, :body_raw, :published_at, :is_active, :permalink, :tag_list, :excerpt, :commentable

  is_taggable :tags
  
  belongs_to :user
  has_many :comments, :dependent => :destroy
  
  before_validation :format_markup
  before_validation :generate_permalink
  before_validation :published
   
  validates_presence_of :title
  validates_uniqueness_of :permalink 
  
  default_scope :order => 'published_at DESC'
  named_scope :publish, :conditions => [ 'published_at < ? and is_active = ?', Time.zone.now, 1]
  
  cattr_reader :per_page
  @@per_page = Spree::Config[:wordsmith_posts_per_page]



  #should be part of is_taggable
  #pulled from http://github.com/gnugeek/is_taggable/commit/10b590865f0effeed20f00e3581a7aed8a6bd3b4
  def self.find_all_tagged_with(tag_or_tags, conditions=[])
    return [] if tag_or_tags.nil? || tag_or_tags.empty?
    case tag_or_tags
    when Array, IsTaggable::TagList
      all(:include => ['tags', 'taggings'], :conditions => conditions ).select { |record| tag_or_tags.all? { |tag| record.tags.map(&:name).include?(tag) } } || []
    else
      all(:include => ['tags', 'taggings'], :conditions => conditions).select { |record| record.tags.map(&:name).include?(tag_or_tags)  } || []
    end
  end
  





  def format_markup
    self.body = RedCloth.new(self.body_raw,[:sanitize_html, :filter_html]).to_html
    
    if self.excerpt.blank?
      self.excerpt = self.body.gsub(/\<[^\>]+\>/, '')[0...50] + "..."
    else
      self.excerpt = self.excerpt.gsub(/\<[^\>]+\>/, '')
    end
    
  end
  
  def generate_permalink
    self.permalink = self.title.dup if self.permalink.blank?
    self.permalink.linkify!
  end
  
  def published
    #self.published_at ||= Time.now unless self.is_active == 0
    if self.is_active == 0
      if !self.published_at.blank?
          self.published_at = nil
      end
    else
      if self.published_at.blank?
          self.published_at = Time.now
      end
    end
  end
  
  def month
    published_at.strftime('%B %Y')
  end
  
  def to_param
    "#{id}-#{permalink}"
  end
  
end
