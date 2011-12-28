# -*- encoding : utf-8 -*-
class Comment < ActiveRecord::Base
  include Rakismet::Model

  belongs_to :post
  belongs_to :comment
  has_many :comments
  
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

# == Schema Information
#
# Table name: comments
#
#  id         :integer         not null, primary key
#  author     :string(255)
#  email      :string(255)
#  url        :string(255)
#  body       :text
#  post_id    :integer
#  published  :boolean
#  created_at :datetime
#  updated_at :datetime
#  ip         :string(255)
#  comment_id :integer
#

