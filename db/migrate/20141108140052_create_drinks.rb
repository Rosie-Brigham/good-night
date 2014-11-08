class CreateDrinks < ActiveRecord::Migration
  def change
    create_table :drinks do |t|
      t.string :name
      t.integer :unit
      t.integer :calorie

      t.timestamps
    end
  end
end
