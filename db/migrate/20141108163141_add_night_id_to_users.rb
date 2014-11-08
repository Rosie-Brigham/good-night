class AddNightIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :night_id, :integer
  end
end
