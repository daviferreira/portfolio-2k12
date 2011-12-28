# -*- encoding : utf-8 -*-
class Photo < ActiveRecord::Base
  belongs_to :project
  has_attached_file :photo, :styles => { :medium => "400x400#", :thumb => "80x80#" }
end

# == Schema Information
#
# Table name: photos
#
#  id                 :integer         not null, primary key
#  title              :string(255)
#  order              :integer
#  project_id         :integer
#  created_at         :datetime
#  updated_at         :datetime
#  photo_file_name    :string(255)
#  photo_content_type :string(255)
#  photo_file_size    :integer
#  photo_updated_at   :datetime
#

