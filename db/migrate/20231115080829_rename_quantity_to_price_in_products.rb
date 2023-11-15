class RenameQuantityToPriceInProducts < ActiveRecord::Migration[7.0]
  def change
    rename_column :products, :quantity, :price
  end
end
