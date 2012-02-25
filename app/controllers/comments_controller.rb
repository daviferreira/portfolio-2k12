# -*- encoding : utf-8 -*-
class CommentsController < ApplicationController

  def create
    params[:comment][:body].gsub!(/\n/, '<br />')
    params[:comment][:ip] = request.remote_ip
    #@remote_ip = request.env["HTTP_X_FORWARDED_FOR"]
    @comment = Comment.new(params[:comment])
    @post = Post.find(@comment.post_id)
    I18n.locale = @post.locale
    @erro = false
    if @comment.save
      if not @comment.spam?
        @comment.toggle!(:published)
        @message = t :comment_submitted
      else
        @erro = true
      end
    else
      @erro = true
    end
  end
  
  def reply
    @comment = Comment.find(params[:id])
    @post = Post.find_using_slug(@comment.post_id)
    I18n.locale = @post.locale
  end

end
