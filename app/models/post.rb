class Post < ActiveRecord::Base
  has_many :comments
  has_many :post_categories
  
  default_scope :order => 'posts.published_date DESC'
  scope :published, :conditions => { :published => true }, :order => 'posts.published_date DESC'
end
