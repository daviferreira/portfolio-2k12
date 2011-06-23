# -*- encoding : utf-8 -*-
class Post < ActiveRecord::Base
  has_many :comments, :dependent => :destroy
  has_many :post_categories, :dependent => :destroy
  has_many :categories, :through => :post_categories
  is_sluggable :title
  
  scope :published, :conditions => { :published => true }, :order => 'posts.published_date DESC'
  
  validates :title, :presence 	=> true
  validates :abstract, :presence 	=> true
  validates :body, :presence 	=> true
  validates :published_date, :presence 	=> true
end
