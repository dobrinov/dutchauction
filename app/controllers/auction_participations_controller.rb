class AuctionParticipationsController < ApplicationController

  def create
    auction_participation = AuctionParticipation.new

    auction = Auction.find(params[:auction_id])

    redirect_to auctions_path and return unless auction.present?

    auction_participation.user    = current_user
    auction_participation.auction = auction

    auction_participation.save
    redirect_to auction_path(auction)
  end

end