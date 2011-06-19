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
  post.block_comments false
end
