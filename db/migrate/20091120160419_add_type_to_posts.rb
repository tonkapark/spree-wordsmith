class AddTypeToPosts < ActiveRecord::Migration
  def self.up
      add_column :posts, :type, :string
      
      add_index :posts, :type, :name => :posts_type_ix
  end

  def self.down
    remove_column :posts, :type
  end
end