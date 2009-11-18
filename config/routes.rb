
map.resources :posts, :as => Spree::Config[:wordsmith_permalink]
map.connect "#{Spree::Config[:wordsmith_permalink]}/tags/:tag_name", :controller => 'posts', :action => 'tags'
map.resources :comments

map.namespace :admin do |admin|
  admin.resource :wordsmith_settings
  admin.resources :posts
end  