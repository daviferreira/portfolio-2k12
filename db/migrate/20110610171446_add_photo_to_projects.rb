class AddPhotoToProjects < ActiveRecord::Migration
  def self.up
    remove_column :projects, :photo_file_name
    remove_column :projects, :photo_content_type
    remove_column :projects, :photo_file_size
    remove_column :projects, :photo_updated_at
    add_column :photos, :photo_file_name,    :string
    add_column :photos, :photo_content_type, :string
    add_column :photos, :photo_file_size,    :integer
    add_column :photos, :photo_updated_at,   :datetime
  end

  def self.down
    add_column :projects, :photo_file_name,    :string
    add_column :projects, :photo_content_type, :string
    add_column :projects, :photo_file_size,    :integer
    add_column :projects, :photo_updated_at,   :datetime
    remove_column :photos, :photo_file_name,    :string
    remove_column :photos, :photo_content_type, :string
    remove_column :photos, :photo_file_size,    :integer
    remove_column :photos, :photo_updated_at,   :datetime
  end
end