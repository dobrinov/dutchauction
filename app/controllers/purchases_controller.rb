class PurchasesController < AuthenticationController

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

  # PUT
  def select_payment
  end

  # POST?PUT - redirect to epay
  def epay
  end

  # POST?PUT - redirect to gate2shop
  def gate2shop
  end


end