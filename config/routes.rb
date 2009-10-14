ActionController::Routing::Routes.draw do |map|
  map.resources :messages

  map.resources :rooms

  map.resources :folks
  
  map.root :controller => "folks", :action => "new"

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
