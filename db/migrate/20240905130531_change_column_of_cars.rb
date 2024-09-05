class ChangeColumnOfCars < ActiveRecord::Migration[7.0]
  def change
    rename_column :cars, :adress, :address
  end
end
