
map.resources :posts, :as => Spree::Config[:wordsmith_permalink], :has_many => :comments

map.namespace :admin do |admin|
  admin.resource :wordsmith_settings
  admin.resources :posts
  admin.resources :comments
end  