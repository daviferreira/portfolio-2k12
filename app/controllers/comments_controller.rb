class CommentsController < ApplicationController

  def create
    params[:comment][:body].gsub!(/\n/, '<br />')
    params[:comment][:ip] = request.remote_ip
    @comment = Comment.new(params[:comment])
    @erro = false
    if @comment.save
      if not @comment.spam?
        @message = "Comentário enviado com sucesso, obrigado."
        @post = Post.find(@comment.post_id)
      else
        @erro = true;
      end
    else
      @erro = true
    end
  end

end
