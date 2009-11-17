class AddRequestDetailsToComment < ActiveRecord::Migration
  def self.up
      remove_column :comments, :ip
      add_column :comments, :user_ip, :string
      add_column :comments, :user_agent, :string
      add_column :comments, :referrer, :string
  end

  def self.down
      add_column :comments, :ip, :string
      remove_column :comments, :user_ip
      remove_column :comments, :user_agent
      remove_column :comments, :referrer
  end
end