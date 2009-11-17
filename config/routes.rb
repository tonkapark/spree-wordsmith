
map.resources :posts, :as => Spree::Config[:wordsmith_permalink]
map.resources :comments

map.namespace :admin do |admin|
  admin.resource :wordsmith_settings
  admin.resources :posts
end  