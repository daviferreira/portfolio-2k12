Portfolio::Application.routes.draw do

  resources :contacts, :only => [:create]  

  resources :comments

  resources :posts

  resources :projects

  resources :tags

  resources :categories
  
  root :to => "projects#index"
  
  match 'live_search' => 'projects#live_search'
  
  match 'projects/category/:category' => 'projects#index'
  match 'projects/tag/:tag' => 'projects#index'
  
  match 'blog' => 'posts#index'
  
  match "/blog/post/:id/:slug.html" => redirect{ |params| "/posts/#{params[:slug]}" }
  
  match "/blog/feed",         :to => "posts#feed", :as => :feed_posts
  match "/post/:id/feed",     :to => "post#feed_comments", :as => :feed_comments
  
  #match '*path' => redirect('/')

end
