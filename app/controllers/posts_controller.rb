# -*- encoding : utf-8 -*-
class PostsController < ApplicationController

  layout "blog"

  def index
    @posts = Post.published.all
    @meta_title = "PHP, jQuery, Javascript, Python, Django, Ruby, Rails - Blog do programador Davi Ferreira";
    @meta_description = "Blog sobre PHP, Design, Interfaces, MySQL, jQuery, Javascript, HTML/CSS, Rails, Ruby, Python e Django. Mantido pelo programador Davi Ferreira."
    
    respond_to do |format|
      format.html
      format.atom { render :action => "feed", :layout => false }
      format.rss { redirect_to feed_posts_path(:format => :atom), :status => :moved_permanently }
    end
  end

  def show
    @post = Post.find_using_slug(params[:id])

    if @post and @post.published?
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
      
      find_previous_and_next 
    end
   
    respond_to do |format|
      format.html { redirect_to blog_path if not @post or not @post.published? or (not @post.tableless.nil? and not @post.tableless.blank?) }
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

  def find_previous_and_next 
    @previous_post = Post.published_local.where("published_date < ? and id != ?", @post.published_date, @post.id).first
    @next_post = Post.published_local.where("published_date > ? and id != ?", @post.published_date, @post.id).last
  end

end
