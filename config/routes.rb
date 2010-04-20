# Put your extension routes here.

 map.namespace :admin do |admin|
   admin.resources :marka_models
   admin.resources :products, :has_many => :compatibilities
   # admin.resources :products, :has_many => :marka_models
 end  
