class AddShortDescriptionToProjects < ActiveRecord::Migration
  def self.up
    add_column :projects, :short_description, :string
  end

  def self.down
    remove_column :projects, :short_description
  end
end
