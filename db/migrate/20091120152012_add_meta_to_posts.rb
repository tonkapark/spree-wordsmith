class AddMetaToPosts < ActiveRecord::Migration
  def self.up
    add_column :posts, :meta_keywords, :string
    add_column :posts, :meta_description, :string
  end

  def self.down
    remove_column :posts, :meta_keywords
    remove_column :posts, :meta_description
  end
end