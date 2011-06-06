class Category < ActiveRecord::Base
  has_many :projects
  is_sluggable :name
end
