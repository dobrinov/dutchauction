class CreateAuctionParticipation < ActiveRecord::Migration
  create_table :auction_participations do |t|
    t.integer :user_id
    t.integer :auction_id
  end
end
