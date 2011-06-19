# -*- encoding : utf-8 -*-
class CreateProjectTags < ActiveRecord::Migration
  def self.up
    create_table :project_tags do |t|
      t.integer :project_id
      t.integer :tag_id

      t.timestamps
    end
  end

  def self.down
    drop_table :project_tags
  end
end
