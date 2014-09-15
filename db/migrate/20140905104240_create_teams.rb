class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.string :crest
      t.string :location
      t.integer :league_id
      t.integer :wins
      t.integer :losses
      t.integer :points

      t.timestamps
    end
  end
end
