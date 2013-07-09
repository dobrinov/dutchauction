class Administration::AuctionsController < Administration::CommonController

  def index
    @auctions = Auction.all
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

end