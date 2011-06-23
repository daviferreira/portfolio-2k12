# -*- encoding : utf-8 -*-
class Admin::HomeController < Admin::AdminController
  
  def index
    if user_signed_in?
      @posts = Post.order("published_date DESC").limit(5)
      @comments = Comment.order("created_at DESC").limit(15)
      @projects = Project.order("created_at DESC").limit(5)
      @post = Post.new
      @categories = Category.where("area!=1")
    else
      redirect_to new_user_session_path
    end
  end
  
end
