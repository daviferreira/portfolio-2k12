class ChangeTablelessOnPosts < ActiveRecord::Migration
  def self.up
    change_column :posts, :tableless, :string
  end

  def self.down
    change_column :posts, :tableless, :boolean
  end
end
