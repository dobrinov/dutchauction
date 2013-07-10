class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.integer :amount

      t.string :state

      t.timestamps
    end
  end
end
