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

    match "/delete_all_spam", :to => "comments#destroy_all_spam", :as => :delete_all_spam
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
  
  scope "(:locale)", :locale => /en/ do
  
    match '/blog' => 'posts#index', :as => :blog
    match '/blog/categories#:category' => 'posts#categories', :as => :posts_category
    match '/blog/categories' => 'posts#categories', :as => :posts_categories
    match '/blog/archive' => 'posts#archive', :as => :posts_archive
  
  end

  match "/blog/post/:id/:slug.html" => redirect{ |params| "/posts/#{params[:slug]}" }

  match "/blog/2007/05/26/definindo-cores-para-seu-lay-out.html" => redirect("/posts/definindo-cores-para-seu-layout")
  match "/blog/2007/05/29/formularios-css.html" => redirect("/posts/formularios-sem-tabelas")
  match "/blog/2007/08/12/interface-drag-and-drop-com-jquery.html" => redirect("/posts/interface-drag-and-drop-com-jquery")
  match "/blog/2007/09/07/classe-imagem-php.html" => redirect("/posts/manipulando-e-redimensionando-imagens-com-php")
  match "/blog/2008/11/20/esqueca-as-funcoes-javascript-alert-e-confirm.html" => redirect("/posts/esqueca-as-funcoes-javascript-alert-e-confirm")
  match "/blog/2009/10/23/11-dicas-de-php-que-talvez-voce-nao-conheca.html" => redirect("/posts/11-dicas-de-php-que-talvez-voce-nao-conheca")

  match "/blog/feed",         :to => "posts#feed", :as => :feed_posts
  match "/post/:id/feed",     :to => "posts#feed_comments", :as => :feed_comments

  match "/comment/:id/reply", :to => "comments#reply", :as => :reply_comment

  match "/blog/rss.html" => redirect("/blog.atom")

  match '*path' => redirect('/')

end
