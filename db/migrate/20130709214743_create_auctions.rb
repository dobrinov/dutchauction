class CreateAuctions < ActiveRecord::Migration
  def change
    create_table :auctions do |t|
      t.string   :title
      t.string   :description
      t.decimal  :start_price,   precision: 8, scale: 2
      t.decimal  :end_price,     precision: 8, scale: 2
      t.decimal  :current_price, precision: 8, scale: 2
      t.decimal  :store_price,   precision: 8, scale: 2
      t.integer  :start_quantity
      t.integer  :current_quantity
      t.integer  :minimum_users_per_product
      t.integer  :maximum_users_per_product
      t.integer  :time_for_purchase
      t.integer  :active_users_timeout

      t.datetime :wait_for_active_users_until
      t.datetime :start_datetime

      t.string :state

      t.timestamps
    end
  end
end