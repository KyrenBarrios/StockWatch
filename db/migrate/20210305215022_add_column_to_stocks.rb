class AddColumnToStocks < ActiveRecord::Migration[6.0]
  def change
    add_column :stocks, :price, :float, default: 0.0
  end
end
