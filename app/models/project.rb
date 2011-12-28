# -*- encoding : utf-8 -*-
class Project < ActiveRecord::Base
  has_attached_file :screenshot, :styles => { :medium => "300x300#", :thumb => "266x186#", :small => "100x100#" }
  belongs_to :category
  has_many :photos
  is_sluggable :name
  
  scope :published, :conditions => { :published => true }, :order => 'projects.due_date DESC'
  
  validates :name, :presence 	=> true
  validates :description, :presence 	=> true
  validates :category_id, :presence 	=> true
  validates :due_date, :presence 	=> true
end

# == Schema Information
#
# Table name: projects
#
#  id                      :integer         not null, primary key
#  name                    :string(255)
#  description             :text
#  url                     :string(255)
#  start_date              :date
#  due_date                :date
#  category_id             :integer
#  published               :boolean
#  created_at              :datetime
#  updated_at              :datetime
#  tags                    :string(255)
#  screenshot_file_name    :string(255)
#  screenshot_content_type :string(255)
#  screenshot_file_size    :integer
#  screenshot_updated_at   :datetime
#  cached_slug             :string(255)
#

