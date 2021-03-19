class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :name
      t.string :email
      t.integer :phone
      t.string :address
      t.float :price
      t.timestamps
    end
  end
end
