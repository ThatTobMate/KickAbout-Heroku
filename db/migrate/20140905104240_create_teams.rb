class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.string :crest
      t.string :location
      t.integer :league_id
      t.integer :wins, default: 0
      t.integer :losses, default: 0
      t.integer :points, default: 0

      t.timestamps
    end
  end
end
