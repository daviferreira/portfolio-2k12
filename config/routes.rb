Portfolio::Application.routes.draw do

  resources :contacts, :only => [:create]  

  resources :comments

  resources :posts

  resources :projects

  resources :tags

  resources :categories
  
  root :to => "projects#index"
  
  match 'live_search' => 'projects#live_search'

end
