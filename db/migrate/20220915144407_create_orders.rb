class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.integer :shipping_postal_code
      t.string :shipping_address
      t.string :shipping_name
      t.string :postage
      t.string :billing_amount
      t.integer :method_of_payment
      t.integer :status
      t.timestamps
    end
  end
end
