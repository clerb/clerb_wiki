ActionController::Routing::Routes.draw do |map|
  map.wiki 'wiki/:title', :controller => 'wiki', :action => 'show'
end
