class AuctionsController < ApplicationController

  def index
    @auctions = Auction.all
  end

  def show
    @auction = Auction.find(params[:id])
    @auction_participation =  AuctionParticipation.new
  end

end