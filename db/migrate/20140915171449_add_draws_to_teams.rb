class AddDrawsToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :draws, :integer, default: 0
  end
end
