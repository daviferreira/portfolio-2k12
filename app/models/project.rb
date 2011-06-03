class Project < ActiveRecord::Base
  has_one :category
  has_many :project_tags
end
