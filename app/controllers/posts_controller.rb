# -*- encoding : utf-8 -*-
class PostsController < ApplicationController

  layout "blog"

  def index
    @posts = Post.published.all
    @meta_title = "PHP, MySQL, jQuery, Javascript, Design, Rails, Ruby - Blog do programador Davi Ferreira";
    @meta_description = "Blog sobre PHP, Design, Interfaces, MySQL, jQuery, Javascript, HTML/CSS, Rails e Ruby. Mantido pelo programador Davi Ferreira."
    
    respond_to do |format|
      format.html
      format.atom { render :action => "feed", :layout => false }
      format.rss { redirect_to feed_posts_path(:format => :atom), :status => :moved_permanently }
    end
  end

  def show
    @post = Post.find_using_slug(params[:id])
    @comment = Comment.new

    if @post.id < 20
      @share_url = "http://www.daviferreira.com/blog/post/#{@post.id}/#{@post.cached_slug}.html"
    else
      @share_url = "http://www.daviferreira.com/posts/#{@post.cached_slug}"
    end

    categories = ""
    unless @post.categories.empty?
      @post.categories.each do |category|
        categories += " | " + category.name
      end
    end
    
    @meta_title = @post.title + categories
    @meta_description = categories + @post.title
    
   
    respond_to do |format|
      format.html { redirect_to blog_path if not @post or not @post.published? }
      format.atom { render :action => "feed_comments", :layout => false }
      format.rss { redirect_to feed_comments_path(:format => :atom), :status => :moved_permanently }
    end
    
  end
  
  def feed
	  @posts = Post.published.limit(20)
  end
  
  def feed_comments
    @post = Post.find_using_slug(params[:id])
  end

end
