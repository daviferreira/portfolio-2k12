module ProjectsHelper

  def tags_as_links(tags)
    links = ""
    tags = tags.split(",")
    tags.each do |t|
      links += link_to "##{t}", "#"
    end
    raw(links)
  end

end
