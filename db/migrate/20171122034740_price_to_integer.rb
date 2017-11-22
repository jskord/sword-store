class PriceToInteger < ActiveRecord::Migration[5.0]
  def change
    change_column :products, :price, "numeric USING CAST(price AS numeric)"
  end
end
