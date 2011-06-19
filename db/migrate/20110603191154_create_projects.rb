# -*- encoding : utf-8 -*-
class CreateProjects < ActiveRecord::Migration
  def self.up
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.string :url
      t.date :start_date
      t.date :due_date
      t.integer :category_id
      t.boolean :published

      t.timestamps
    end
  end

  def self.down
    drop_table :projects
  end
end
