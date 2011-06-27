# -*- encoding : utf-8 -*-
class CommentsController < ApplicationController

  def create
    params[:comment][:body].gsub!(/\n/, '<br />')
    params[:comment][:ip] = request.env["HTTP_X_FORWARDED_FOR"] #request.remote_ip
    @comment = Comment.new(params[:comment])
    @erro = false
    if @comment.save
      if not @comment.spam?
				@comment.toggle!(:published)
        @message = "Comentário enviado com sucesso, obrigado."
        @post = Post.find(@comment.post_id)
      else
        @erro = true;
      end
    else
      @erro = true
    end
  end
  
  def reply
    @comment = Comment.find(params[:id])
    @post = Post.find_using_slug(@comment.post_id)
  end

end
