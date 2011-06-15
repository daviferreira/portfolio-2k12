class PostsController < ApplicationController

  def index
    @posts = Post.published.all

  end

  def show
    @post = Post.find_using_slug(params[:id])
    @comment = Comment.new
    redirect_to blog_path if not @post
  end

end
