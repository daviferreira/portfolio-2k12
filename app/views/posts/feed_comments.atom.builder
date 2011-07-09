atom_feed do |feed|
  unless @post.comments.published.empty?
    feed.title("#{@post.title} - Comentários")
    feed.updated(@post.comments.published.first.created_at)

    for comment in @post.comments.published
      next if comment.updated_at.blank?  
        feed.entry(comment, :url => (post_path(@post)) + "#comment-#{comment.id}") do |entry|
          entry.title(@post.title)  
          entry.content(comment.body, :type => 'html')
          entry.updated(comment.updated_at.strftime("%Y-%m-dT%H:%M:%SZ"))
          entry.author(comment.author)
        end
      end
  end
end
