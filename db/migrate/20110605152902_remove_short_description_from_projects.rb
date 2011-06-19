# -*- encoding : utf-8 -*-
class RemoveShortDescriptionFromProjects < ActiveRecord::Migration
  def self.up
    remove_column :projects, :short_description
  end

  def self.down
    add_column :projects, :short_description, :string
  end
end
