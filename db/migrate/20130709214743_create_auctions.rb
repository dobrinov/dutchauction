class CreateAuctions < ActiveRecord::Migration
  def change
    create_table :auctions do |t|
      t.string :title
      t.string :description

      t.string :state

      t.timestamps
    end
  end
end
