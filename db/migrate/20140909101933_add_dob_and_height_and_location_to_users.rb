class AddDobAndHeightAndLocationToUsers < ActiveRecord::Migration
  def change
    add_column :users, :dob, :date
    add_column :users, :height, :float
    add_column :users, :location, :string
  end
end
