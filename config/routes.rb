# -*- encoding : utf-8 -*-
Portfolio::Application.routes.draw do

  resources :contacts, :only => [:create]  

  resources :comments, :only => [:create]

  resources :posts

  resources :projects



  namespace :admin do 
    
    root :to => "home#index"
    
    resources :categories
    resources :users
    resources :projects
    resources :posts
    resources :comments
    resources :photos
    
    match "/project/:id/delete_screenshot", :to => "projects#destroy_screenshot", :as => :delete_project_screenshot
    match "/photo/:id/delete_photo", :to => "photos#destroy_photo", :as => :delete_photo

  end


  scope '/admin' do
    devise_for :users, :controllers => { :sessions => "admin/sessions" }, :skip => [:sessions] do
      get 'signin' => 'admin/sessions#new', :as => :new_user_session
      post 'signin' => 'admin/sessions#create', :as => :user_session
      get 'signout' => 'admin/sessions#destroy', :as => :destroy_user_session
    end
    devise_scope :user do 
      match "/users/:id/edit" => "admin/users#edit" 
      match "/users/new" => "admin/users#new" 
      match "/users" => "admin/users#index" 
    end
  end
  
  root :to => "projects#index"
  
  match '/live_search' => 'projects#live_search'
  
  match '/projects/category/:category' => 'projects#index'
  match '/projects/tag/:tag' => 'projects#index'
  
  match '/blog' => 'posts#index', :as => :blog
  
  match "/blog/post/:id/:slug.html" => redirect{ |params| "/posts/#{params[:slug]}" }
  
  match "/blog/feed",         :to => "posts#feed", :as => :feed_posts
  match "/post/:id/feed",     :to => "posts#feed_comments", :as => :feed_comments
  
  match "/comment/:id/reply", :to => "comments#reply", :as => :reply_comment
  
  match "/blog/rss.html" => redirect("/blog.atom")

  match '*path' => redirect('/')

end
