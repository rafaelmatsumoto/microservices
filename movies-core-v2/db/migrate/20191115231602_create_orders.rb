class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :user_email
      t.decimal :price

      t.timestamps
    end
  end
end
