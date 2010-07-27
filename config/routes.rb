ActionController::Routing::Routes.draw do |map|
  map.resources :entries, :only => [:index, :show]
  map.root :controller => "entries"
end
