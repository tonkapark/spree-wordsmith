Wordsmith 1.9
=========

A blog/cms extension for spree. Admin users in Spree can create blog posts and static pages. The comment system has been outsourced using the Disqus system. Posts and pages can have commenting disabled allowing the site to work without the Disqus api enabled.

Wordsmith has provided the basic views and a stylesheet that can easily be overridden in your site extension. Also several helpers exist to allow tags, posts and pages to be accesible in your site views.

Wordsmith uses concepts from many projects and tries to integrate them nicely with Spree making it easy to use the extension in your own site.


Installation
------------

'script/extension install git://github.com/tonkapark/spree-wordsmith.git'

rake gems:install

rake db:migrate

All authors for the blog should be given a display name in the admin/users edit form. A new display_name field is added to the spree users table. 

Edit preferences in wordsmith_extension.rb

script/server

Setup
------

in wordsmith_extension.rb add your disqus account identifier if you plan to use comments.

You can edit the preferences in the extension.rb file or in the http://localhost:3000/admin/wordsmith_settings ui.

The blog home slug requires a server restart so it can only be edited in the extension file.

Wordsmith adds a new column to the users model, display_name. For each admin user that will be blogging a display_name should be given. This can be used for display as the post author. The display_name field is made available only on the admin user view by default but could easily be extended to the public user views.


Posts
-------

New Posts can be created in the admin section http://localhost:3000/admin/posts

Posts have unique permalinks created for all new post entries. The permalink can be modified after initial save.

RedCloth is used for post formatting.

is_taggable gem is used for adding tags to each post. A helper linked_tag_list is provided to display a list of the link tags to filter by.


Comments
--------

Comments can be opened or closed for a post or page.  The comment form displays on the post page when enabled for the specific post.

Comments are now managed by Disqus via the disqus gem, http://github.com/norman/disqus/. Management of spam and comment moderation is done through the disqus ui.

Create disqus account at http://disqus.com/.  


Blog
-----

View the blog at http://localhost:3000/blog or the defined slug from the preferences.

Use helper post_link_list(limit) to get a list of recent post links.

Views are in folder extension/app/views/posts


RSS
-----

http://localhost:3000/blog.rss - All Posts

Customize RSS feed in extension/app/views/posts/index.rss.builder


Pages
-----

Integrated portions of spree-static-content, http://peterberkenbosch.github.com/spree-static-content/

Under Admin section add pages for static-content.

Use helper page_link() to print a link to page, based on ID or Permalink.

Pages are displayed by the content route provided by Spree core. Customize the extension/app/views/content/show.html.erb file.



Tips
--------

You can add a blog link anywhere on your site or include the recent_articles partial.

One option is to add the Blog link to the store_menu partial

'<li><%= link_to t('blog'), posts_path %></li>'

Use the wordsmith_content_for partial to include the wordsmith css and recent articles partial in the sidebar.

'<%= render :partial => 'shared/wordsmith_content_for'%>'



TODO
-----

- improve permalinks for posts

- wysiwyg editor for blog posts and pages.

- tests

- store and save links (aka blogroll)


Credits
-------

created by [Matt Anderson](http://tonkapark.com/)