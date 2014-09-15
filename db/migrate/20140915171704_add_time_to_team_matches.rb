class AddTimeToTeamMatches < ActiveRecord::Migration
  def change
    add_column :team_matches, :time, :datetime
  end
end
