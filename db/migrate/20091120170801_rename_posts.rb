class RenamePosts < ActiveRecord::Migration
  def self.up
    rename_table :posts, :ws_items
  end

  def self.down
    rename_table :ws_items, :posts
  end
end