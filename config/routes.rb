ActionController::Routing::Routes.draw do |map|
  map.resources :wiki_documents, :as => :wiki, :controller => "wiki"
  map.wiki_document_version '/wiki/:id/:version', :controller => "wiki", :action => :show
  map.root :controller=>"wiki", :action=>"index"
end
