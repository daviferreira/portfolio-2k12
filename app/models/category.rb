# -*- encoding : utf-8 -*-
class Category < ActiveRecord::Base
  has_many :projects
  has_many :post_categories, :dependent => :destroy
  has_many :posts, :through => :post_categories
  is_sluggable :name

	validates :name, :presence 	=> true
end

# == Schema Information
#
# Table name: categories
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  area        :integer
#  created_at  :datetime
#  updated_at  :datetime
#  cached_slug :string(255)
#

