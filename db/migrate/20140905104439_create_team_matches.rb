class CreateTeamMatches < ActiveRecord::Migration
  def change
    create_table :team_matches do |t|
      t.integer :team_a_id, :null => false
      t.integer :team_b_id, :null => false
      t.boolean :status
      t.string :title
      t.string :location
      t.integer :result

      t.timestamps
    end
  end
end
