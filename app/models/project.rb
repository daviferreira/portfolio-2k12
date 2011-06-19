# -*- encoding : utf-8 -*-
class Project < ActiveRecord::Base
  has_attached_file :screenshot, :styles => { :medium => "300x300#", :thumb => "266x186#", :small => "100x100#" }
  belongs_to :category
  has_many :photos
  is_sluggable :name
  
  default_scope :order => 'projects.due_date DESC'
  scope :published, :conditions => { :published => true }, :order => 'projects.due_date DESC'
end
