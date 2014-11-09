class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :age
      t.string :email
      t.integer :weight
      t.string :gender
      t.datetime :do

      t.timestamps
    end
  end
end
