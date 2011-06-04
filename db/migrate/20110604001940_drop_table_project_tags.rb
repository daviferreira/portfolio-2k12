class DropTableProjectTags < ActiveRecord::Migration
  def self.up
		drop_table :project_tags
		drop_table :post_tags
	end

  def self.down
  end
end
