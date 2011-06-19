# -*- encoding : utf-8 -*-
class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.string :title
      t.text :abstract
      t.text :body
      t.date :published_date
      t.string :meta_title
      t.string :meta_description
      t.boolean :block_comments
      t.boolean :published

      t.timestamps
    end
  end

  def self.down
    drop_table :posts
  end
end
