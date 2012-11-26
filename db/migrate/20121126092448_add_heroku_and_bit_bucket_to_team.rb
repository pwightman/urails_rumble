class AddHerokuAndBitBucketToTeam < ActiveRecord::Migration
  def change
    add_column :teams, :heroku, :text
    add_column :teams, :bit_bucket, :text
  end
end
