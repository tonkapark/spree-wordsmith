Wordsmith
=========

A blog/news extension for spree. Includes comments. Chose the name wordsmith since spree-blog already exists. I decided I wanted something different so came up with the unique name.


Installation
------------

'script/extension install git://github.com/tonkapark/spree-wordsmith.git'

rake gems:install

rake db:migrate

All authors for the blog should be given a display name in the admin/users edit form. A new display_name field is added to the spree users table. 


Posts
-------

New Posts can be created in the admin section http://localhost:3000/admin/posts

Posts can be given unique permalinks once they have been initially created.

By default the excerpt will be created with the first 50 characters of the body.

RedCloth is used for post formatting.

is_taggable gem is used for adding tags to each post.


Comments
--------

Comments can be opened or closed.  The comment form displays on the post page when enabled for the specific post.

Anonymous comments are not allowed. A name and email are required. Still working on integrating into the spree user model.

A helper function is used to make comments safe and even allow some html for formatting.

When a comment is posted an email will be sent to the author of the post.


Blog
-----

View the blog at http://localhost:3000/blog or the defined slug from the preferences.

A partial for the sidebar is available that shows recent posts.
 

Settings
------------

http://localhost:3000/admin/wordsmith_settings

Default settings are set in the wordsmith_extension.rb file. There is also an wordsmith_settings screen in the admin section to manage the preference values. The blog home permalink requires a server restart so it can only be edited in the extension file.


TODO
-----

- comment error handling is broken.

- improve permalinks for posts

- wysiwyg editor for blog posts

- better integration with Spree users on comments and posts

- spam filtering for comments

- filtering by tags

- tag sidebar partial

- improved html for posts for easier styling.

- tests


Credits
-------

created by [Matt Anderson](http://tonkapark.com/)