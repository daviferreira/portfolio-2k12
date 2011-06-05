class Project < ActiveRecord::Base
  has_one :category
  has_attached_file :screenshot, :styles => { :medium => "300x300#", :thumb => "184x150#" }
  
  default_scope :order => 'projects.due_date DESC'
  scope :published, :conditions => { :published => true }, :order => 'projects.due_date DESC'
end
