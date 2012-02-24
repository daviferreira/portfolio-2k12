class AddLocaleToPosts < ActiveRecord::Migration
  def self.up
    add_column :posts, :locale, :string, :default => 'pt_BR'
  end

  def self.down
    remove_column :posts, :locale
  end
end
