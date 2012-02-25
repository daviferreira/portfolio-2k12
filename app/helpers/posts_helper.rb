# -*- encoding : utf-8 -*-
module PostsHelper
  def total_comments_in_words(total)
    if total > 1 
      "#{total} #{t :comments}."
    elsif total == 1
      "1 #{t :comment}."
    else
     t :no_comments 
    end
  end

  def post_url(post)
    if from_tableless(post)
      post.tableless 
    else
      post_path(post)
    end
  end

  def from_tableless(post)
    if not post.tableless.nil? and not post.tableless.blank?
      true
    else
      false
    end
  end
end
