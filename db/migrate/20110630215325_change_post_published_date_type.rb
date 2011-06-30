class ChangePostPublishedDateType < ActiveRecord::Migration
  def self.up
		change_column :posts, :published_date, :datetime
	end

  def self.down
		change_colum :posts, :published_date, :date
  end
end
