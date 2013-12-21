AngellistSearch::Application.routes.draw do
  root 'search#index'
  get '/search' => 'search#compare'
end
