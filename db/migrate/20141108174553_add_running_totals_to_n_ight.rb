class AddRunningTotalsToNIght < ActiveRecord::Migration
  def change
    add_column :nights, :running_calories, :integer
    add_column :nights, :running_time, :integer
  end
end
