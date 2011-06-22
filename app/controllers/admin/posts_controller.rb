# -*- encoding : utf-8 -*-
class Admin::PostsController < Admin::AdminController
 
  before_filter :authenticate_user!

  def index
    @posts = Post.order("published_date DESC").paginate(:page => params[:page], :per_page => 50)
  end

  def show
    @post = Post.find_using_slug(params[:id])
  end

  def new
    @post = Post.new 
  end
  
  def edit
    @post = Post.find_using_slug(params[:id])
  end

  def create
    @post = Post.create(params[:post])
    if @post.save
      @post.generate_slug!
      flash[:success] = "Post cadastrada com sucesso."
      redirect_to admin_posts_path
    else
      render 'new'
    end
  end

  def update
    @post = Post.find_using_slug(params[:id])

    if @post.update_attributes(params[:post])
      flash[:success] = "Post editada com sucesso."
      redirect_to admin_posts_path
    else
      render 'edit'
    end
  end
  
  def destroy
    @post = Post.find_using_slug(params[:id])
		@post.destroy
		flash[:success] = "Post excluída com sucesso"
		redirect_to admin_posts_path
  end

end
