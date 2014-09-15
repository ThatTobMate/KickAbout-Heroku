class AddDrawsToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :draws, :integer
  end
end
