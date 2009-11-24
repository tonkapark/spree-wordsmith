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


RSS
-----

http://localhost:3000/blog.rss - All Posts


Pages
-----

Integrated portions of spree-static-content, http://peterberkenbosch.github.com/spree-static-content/

Under Admin section add pages for static-content.

Use helper page_link() to print a link to page, based on ID or Permalink.


Settings
------------

http://localhost:3000/admin/wordsmith_settings

Default settings are set in the wordsmith_extension.rb file. There is also an wordsmith_settings screen in the admin section to manage the preference values. The blog home permalink requires a server restart so it can only be edited in the extension file.


TODO
-----

- improve permalinks for posts

- wysiwyg editor for blog posts and pages.

- tests

- store and save links (aka blogroll)


Credits
-------

created by [Matt Anderson](http://tonkapark.com/)