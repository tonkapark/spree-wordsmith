class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|      
      t.integer :user_id
      t.string :title, :null => false,  :limit => 128
      t.text :body
      t.text :body_raw
      t.text :excerpt
      t.integer :is_active, :default => 0
      t.string :permalink, :null => false,  :limit => 128
      t.datetime :published_at
      t.integer :commentable, :default => 0
      t.integer :comments_count, :default => 0

      t.timestamps
    end
    
    add_index "posts", ["published_at"], :name => "posts_published_at_ix"
    add_index "posts", ["permalink"], :name => "posts_permalink_ix"
    add_index "posts", ["is_active","published_at"], :name => "posts_is_active_published_at_ix"
  end

  def self.down
    drop_table :posts
  end
end
