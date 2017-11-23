class AddInStockColumn < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :instock, :boolean
  end
end
