class AddDrinkAmountToNights < ActiveRecord::Migration
  def change
    add_column :nights, :sm_wine_no, :integer
    add_column :nights, :me_wine_no, :integer
    add_column :nights, :lg_wine_no, :integer
    add_column :nights, :pint_beer_no, :integer
    add_column :nights, :bottle_beer_no, :integer
    add_column :nights, :half_beer_no, :integer
    add_column :nights, :single_spirit_no, :integer
    add_column :nights, :double_spirit_no, :integer
    add_column :nights, :pop_no, :integer
  end
end
