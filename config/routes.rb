ActionController::Routing::Routes.draw do |map|
  map.resources :wiki
  map.root :controller=>"wiki", :action=>"index"
end
