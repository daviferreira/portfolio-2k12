class Comment < ActiveRecord::Base
  belongs_to :post
  
  default_scope :order => 'comments.created_at ASC'
  scope :published, :conditions => { :published => true }, :order => 'comments.created_at ASC'
end
