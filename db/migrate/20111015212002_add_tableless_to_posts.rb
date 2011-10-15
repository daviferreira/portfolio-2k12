class AddTablelessToPosts < ActiveRecord::Migration
  def self.up
    add_column :posts, :tableless, :boolean
  end

  def self.down
    remove_column :posts, :tableless
  end
end
