class PostsController < ApplicationController

  def index
    @posts = Post.published.all
    @meta_title = "PHP, MySQL, jQuery, Javascript, Design, Rails, Ruby - Blog do programador Davi Ferreira";
    @meta_description = "Blog sobre PHP, Design, Interfaces, MySQL, jQuery, Javascript, HTML/CSS, Rails e Ruby. Mantido pelo programador Davi Ferreira."
  end

  def show
    @post = Post.find_using_slug(params[:id])
    categories = ""
    unless @post.post_categories.empty?
      categories = " |"
      @post.post_categories.each do |post_category|
        category = Category.find(post_category.category_id)
        categories += " " + category.name
      end
    end
    @meta_title = @post.title + categories
    @meta_description = categories + @post.title
    redirect_to blog_path if not @post or not @post.published?
  end

end
