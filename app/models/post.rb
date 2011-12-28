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

# == Schema Information
#
# Table name: posts
#
#  id               :integer         not null, primary key
#  title            :string(255)
#  abstract         :text
#  body             :text
#  published_date   :datetime
#  meta_title       :string(255)
#  meta_description :string(255)
#  block_comments   :boolean
#  published        :boolean
#  created_at       :datetime
#  updated_at       :datetime
#  tags             :string(255)
#  cached_slug      :string(255)
#  tableless        :string(255)
#

