ActionController::Routing::Routes.draw do |map|
  map.resources :wiki_documents, :as => :wiki, :controller => "wiki"
  map.root :controller=>"wiki", :action=>"index"
end
