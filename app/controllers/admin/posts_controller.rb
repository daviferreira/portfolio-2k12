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
    @categories = Category.where("area!=1")
  end
  
  def edit
    @post = Post.find_using_slug(params[:id])
    @categories = Category.where("area!=1")
  end

  def create
    @post = Post.create(params[:post])
    if @post.save
      save_categories
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
      save_categories
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
  
  private
  
    def save_categories
      if @post.post_categories and not @post.post_categories.empty?
        @post.post_categories.each do |post_category|
          post_category.destroy
        end
      end
      
      if params[:categories] and not params[:categories].empty?
        params[:categories].each do |category|
          post_category = PostCategory.create({:post_id => @post.id, :category_id => category})
          post_category.save
        end
      end
    end

end
