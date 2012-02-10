# -*- encoding : utf-8 -*-
class Post < ActiveRecord::Base
  has_many :comments, :dependent => :destroy
  has_many :post_categories, :dependent => :destroy
  has_many :categories, :through => :post_categories
  is_sluggable :title
  
  scope :published, :conditions => { :published => true }, :order => 'posts.published_date DESC'
  scope :published_local, :conditions => "published = 't' AND (tableless IS NULL OR tableless = '')", :order => 'posts.published_date DESC'
  
  validates :title, :presence 	=> true
  validates :abstract, :presence 	=> true
  validates :body, :presence 	=> true
  validates :published_date, :presence 	=> true
  
  def previous_post
    self.class.published_local.where("published_date < ? AND id != ?", published_date, id).first
  end
  
  def next_post
    self.class.published_local.where("published_date > ? AND id != ?", published_date, id).last
  end
end
