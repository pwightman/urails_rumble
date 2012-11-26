class AddPasswordToTeams < ActiveRecord::Migration
  def up
    add_column :teams, :password, :string
    add_column :teams, :bit_bucket, :text
    add_column :teams, :heroku, :text
  end

  def down
    remove_column :teams, :password, :string
    remove_column :teams, :bit_bucket, :text
    remove_column :teams, :heroku, :text
  end

end
