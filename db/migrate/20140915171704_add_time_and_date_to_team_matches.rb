class AddTimeAndDateToTeamMatches < ActiveRecord::Migration
  def change
    add_column :team_matches, :date, :date
    add_column :team_matches, :time, :time
  end
end
