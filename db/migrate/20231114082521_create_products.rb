class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :title
      t.integer :quantity

      t.timestamps
    end
  end
end
