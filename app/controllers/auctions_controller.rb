class AuctionsController < ApplicationController

  def index
    @auctions = Auction.all
  end

  def show
  end

end