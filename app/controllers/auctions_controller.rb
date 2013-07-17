class AuctionsController < ApplicationController

  def index
    @auctions = Auction.all
  end

  def show
    @auction = Auction.find(params[:id])

    respond_to do |format|
      format.html {}
      format.js   {}
    end
  end

end