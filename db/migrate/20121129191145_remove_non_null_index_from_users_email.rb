class RemoveNonNullIndexFromUsersEmail < ActiveRecord::Migration
  def up
    remove_index :users, :email
    add_index :users, :uid, :unique => true, :null => false 
    add_index :users, :provider
  end

  def down
  end
end
