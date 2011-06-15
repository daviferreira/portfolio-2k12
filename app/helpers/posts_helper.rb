module PostsHelper
  def total_comments_in_words(total)
    if total > 0
      "#{total} comentários."
    elsif total == 1
      "1 comentário"
    else
      "Ninguém comentou este post."
    end
  end
end
