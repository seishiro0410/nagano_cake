class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|
      t.integer :item_id
      t.integer :order_id
      t.string :tax_included_price
      t.string :purchase_quantity
      t.integer :is_production
      t.timestamps
    end
  end
end
