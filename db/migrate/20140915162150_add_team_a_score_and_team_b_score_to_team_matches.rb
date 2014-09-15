class AddTeamAScoreAndTeamBScoreToTeamMatches < ActiveRecord::Migration
  def change
    add_column :team_matches, :team_a_score, :integer
    add_column :team_matches, :team_b_score, :integer
  end
end
