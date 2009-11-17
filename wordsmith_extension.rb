# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class WordsmithExtension < Spree::Extension
  version "1.1"
  description "A blog/news extension for spree"
  url "http://tonkapark.com/"

  # Please use blog/config/routes.rb instead for extension routes.

  def self.require_gems(config)
    config.gem 'is_taggable'
    config.gem 'RedCloth', :version => '4.2.2'
  end
  
  def activate

    # Add your extension tab to the admin.
    # Requires that you have defined an admin controller:
    # app/controllers/admin/yourextension_controller
    # and that you mapped your admin in config/routes

    Admin::BaseController.class_eval do
      before_filter :add_wordsmith_tab
    #
      def add_wordsmith_tab
    #    # add_extension_admin_tab takes an array containing the same arguments expected
    #    # by the tab helper method:
    #    #   [ :extension_name, { :label => "Your Extension", :route => "/some/non/standard/route" } ]
        add_extension_admin_tab [ :wordsmith, { :label => t("Wordsmith"), :route => :admin_posts } ]
      end
    end

    # make your helper avaliable in all views
    Spree::BaseController.class_eval do
      helper PostsHelper
      helper CommentsHelper
    end
    
    AppConfiguration.class_eval do
      preference :wordsmith_permalink, :string, :default => 'blog'      
      preference :wordsmith_posts_per_page, :integer, :default => 5
      preference :wordsmith_posts_recent, :integer, :default => 15
      preference :wordsmith_post_comment_default, :integer, :default => 1
      preference :wordsmith_post_status_default, :integer, :default => 0
      preference :wordsmith_mailer_from, :string, :default => 'blog@localhost.com'
      preference :wordsmith_rss_description, :string, :default => 'Martha Daniels blog posts on architectural concepts and home design.'
    end
    
    # TODO: Not sure I like this solution for the long term because you cannot control placement in view.
    Admin::UsersController.class_eval do
      before_filter :add_display_name_field
      def add_display_name_field
        @extension_partials << 'display_name'
      end
    end    
    
    User.class_eval do
        has_many :posts
        has_many :comments      
        
        attr_accessible :display_name        
    end
    
    
  end
end
