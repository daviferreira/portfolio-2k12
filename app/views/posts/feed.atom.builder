atom_feed do |feed|
  feed.title("Davi Ferreira - Posts")
  feed.updated(@posts.first.created_at)

  for post in @posts
    next if post.updated_at.blank?  
      feed.entry(post, :url => post_url(post)) do |entry|
        entry.title(post.title)  
        entry.content(post.body, :type => 'html')
        entry.updated(post.updated_at.strftime("%Y-%m-dT%H:%M:%SZ"))
        entry.author("Davi Ferreira")
      end
    end
end
