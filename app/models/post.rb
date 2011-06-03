class Post < ActiveRecord::Base
  has_many :comments
  has_many :post_categories
  has_many :post_tags
end
