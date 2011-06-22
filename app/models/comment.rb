# -*- encoding : utf-8 -*-
class Comment < ActiveRecord::Base
  include Rakismet::Model

  belongs_to :post
  
  rakismet_attrs :author_url => :url,
                   :author_email => :email,
                   :content => :body,
                   :user_ip => :ip
  
  scope :published, :conditions => { :published => true }, :order => 'comments.created_at ASC'
  
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	validates :author, :presence 	=> true
	validates :email, :presence 	=> true,
									  :format			=> { :with => email_regex }
	validates :body, :presence => true
										
end
