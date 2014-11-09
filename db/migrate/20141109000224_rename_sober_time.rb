class RenameSoberTime < ActiveRecord::Migration
  def change
    rename_column :users, :sober_time, :targettime
  end
end
