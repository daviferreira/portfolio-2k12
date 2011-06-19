# -*- encoding : utf-8 -*-
class Post < ActiveRecord::Base
  has_many :comments
  has_many :post_categories, :dependent => :destroy
  has_many :categories, :through => :post_categories
  is_sluggable :title
  
  default_scope :order => 'posts.published_date DESC'
  scope :published, :conditions => { :published => true }, :order => 'posts.published_date DESC'
end
