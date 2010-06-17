# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class WordsmithExtension < Spree::Extension
  version "2.0"
  description "A blog/cms extension for spree"
  url "http://github.com/tonkapark/spree-wordsmith"

  # Please use blog/config/routes.rb instead for extension routes.

  def self.require_gems(config)
    config.gem 'is_taggable'
    config.gem 'RedCloth'
    config.gem 'disqus'
  end
  
  def activate

    Disqus::defaults[:account] = "my_disqus_account_name"
    # Optional, only if you're using the API
    Disqus::defaults[:api_key] = "my_disqus_api_key"    
    unless RAILS_ENV == "production"
      Disqus::defaults[:developer] = true
    end


    # make your helper avaliable in all views
    Spree::BaseController.class_eval do
      helper WordsmithHelper      
      
      before_filter :render_page_if_exists
      
      def render_page_if_exists
        # Using request.path allows us to override dynamic pages including
        # the home page, product and taxon pages. params[:path] is only good
        # for requests that get as far as content_controller. params[:path]
        # query left in for backwards compatibility for slugs that don't start
        # with a slash.
        @page = Page.publish.find_by_permalink(params[:path]) if params[:path]
        @page = Page.publish.find_by_permalink(request.path) unless @page
        render :template => 'content/show' if @page
      end      
      
      # Returns post.title for use in the <title> element. 
      def title_with_wordsmith_post_check
        return "#{@post.title} - #{Spree::Config[:site_name]}" if @post && !@post.title.blank?
        title_without_wordsmith_post_check
      end
      alias_method_chain :title, :wordsmith_post_check      
      
    end
    
    AppConfiguration.class_eval do
      preference :wordsmith_permalink, :string, :default => 'blog'      
      preference :wordsmith_posts_per_page, :integer, :default => 5
      preference :wordsmith_posts_recent, :integer, :default => 15
      preference :wordsmith_post_comment_default, :integer, :default => 1
      preference :wordsmith_post_status_default, :integer, :default => 0
      preference :wordsmith_page_status_default, :integer, :default => 0
      preference :wordsmith_page_comment_default, :integer, :default => 0
      preference :wordsmith_rss_description, :string, :default => 'description about your main post rss.'
    end
      
    
    User.class_eval do
        has_many :ws_items
        
        attr_accessible :display_name        
    end
    
    
  end
end
