class AddFieldnameToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :password, :string
  end
end
