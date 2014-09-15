class AddTeamIdAndPositionToUsers < ActiveRecord::Migration
  def change
    add_column :users, :team_id, :integer
    add_column :users, :position, :string
  end
end
