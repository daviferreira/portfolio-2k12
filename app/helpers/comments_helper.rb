# -*- encoding : utf-8 -*-
module CommentsHelper

  def gravatar_for(comment, options = { :size => 69 })
    gravatar_image_tag(comment.email.downcase, :alt => comment.author, :class => 'gravatar', :gravatar => options)
  end

end
