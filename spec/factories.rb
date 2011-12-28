# -*- encoding : utf-8 -*-
Factory.define :project do |project|
  project.name "Foo"
  project.description "Bar"
  project.category_id 1
  project.tags "tag1, tag2"
  project.published true
  project.due_date "2011-01-01 11:11:11"
end

Factory.define :category do |category|
  category.name "Foo"
end

Factory.define :post do |post|
  post.title "Title"
  post.abstract "Abstract"
  post.body "Post"
  post.published_date "2011-01-01 11:11:11"
  post.published true
  post.tableless nil
  post.block_comments false
end

Factory.define :comment do |comment|
  comment.author "Author"
  comment.email "author@example.com"
  comment.url "http://example.com"
  comment.body "Test comment"
  comment.published true
  comment.ip "127.0.0.1"
  comment.association :post
  comment.comment_id nil
end
