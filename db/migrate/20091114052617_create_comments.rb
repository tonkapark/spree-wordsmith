class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.integer :user_id
      t.integer :post_id
      t.string :status
      t.string :name, :limit => 128
      t.string :email, :limit => 244
      t.string :url, :limit => 244
      t.string :ip, :limit => 128      
      t.text :body
      
      t.timestamps
    end
    
    add_index "comments", ["post_id"], :name => "comments_post_id_ix"
    add_index "comments", ["status"], :name => "comments_status_ix"
  end

  def self.down
    drop_table :comments
  end
end
