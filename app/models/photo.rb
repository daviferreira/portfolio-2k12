# -*- encoding : utf-8 -*-
class Photo < ActiveRecord::Base
  belongs_to :user
  has_attached_file :photo, :styles => { :medium => "400x400#", :thumb => "80x80#" }
end
