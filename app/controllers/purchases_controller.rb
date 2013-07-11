class PurchasesController < ApplicationController

  # POST
  def reserve
    @auction  = Auction.find(params[:auction_id])
    @purchase = Purchase.new

    # Create purchase
    # Reserve a product
  end

  # GET
  def payment_selection
  end

  # POST
  def select_payment
  end

  # POST - redirect to epay
  def epay
  end

  # POST - redirect to gate2shop
  def gate2shop
  end


end