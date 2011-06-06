class AddCachedSlugToPosts < ActiveRecord::Migration
  
  def self.up
    add_column :posts, :cached_slug, :string
    add_index  :posts, :cached_slug
  end

  def self.down
    remove_column :posts, :cached_slug
  end
  
end
