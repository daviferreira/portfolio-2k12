# -*- encoding : utf-8 -*-
# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "http://www.daviferreira.com"

SitemapGenerator::Sitemap.create do
  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host

  add projects_path, :priority => 0.7, :changefreq => 'weekly'
  add blog_path, :priority => 0.7, :changefreq => 'weekly'
  
  Project.published.each do |project|
    add project_path(project), :lastmod => project.updated_at
  end
  
  Post.published.each do |post|
    if post.tableless.nil? or post.tableless.blank?
      add post_path(post), :lastmod => post.updated_at
    end
  end
  
end
