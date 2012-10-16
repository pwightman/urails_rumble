class AddUniqueIndexToPledges < ActiveRecord::Migration
  def change
    add_index :pledges, :email, :unique => true
  end
end
