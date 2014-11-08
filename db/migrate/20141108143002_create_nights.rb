class CreateNights < ActiveRecord::Migration
  def change
    create_table :nights do |t|
      t.integer :user_id
      t.datetime :starttime
      t.datetime :endtime

      t.timestamps
    end
  end
end
