ActionController::Routing::Routes.draw do |map|
  map.resources :wiki, :except=>[:show]
  map.wiki 'wiki/:title', :controller => 'wiki', :action => 'show'
  map.root :controller=>"wiki", :action=>"index"
end
