
map.resources :posts, :as => Spree::Config[:wordsmith_permalink]
map.tag_posts "#{Spree::Config[:wordsmith_permalink]}/tags/:tag_name", :controller => 'posts', :action => 'tags'
map.resources :comments
map.resources :pages

map.namespace :admin do |admin|
  admin.resource :wordsmith_settings
  admin.resources :posts
  admin.resources :pages
end  