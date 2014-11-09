class AddSoberTimeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :sober_time, :datetime
  end
end
