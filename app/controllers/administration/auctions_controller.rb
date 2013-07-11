class Administration::AuctionsController < Administration::CommonController

  def index
    @auctions = Auction.all
  end

  def show
    @auction = Auction.find(params[:id])
  end

  def new
    @auction = Auction.new
  end

  def create
    @auction = Auction.new(params[:auction])

    if @auction.save
      redirect_to administration_auctions_path, notice: 'Auction created'
    else
      flash.now[:error] = 'Auction not created'
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def schedule
    @auction = Auction.find(params[:auction_id])
    @auction.schedule
    redirect_to administration_auction_path(@auction)
  end

  def start
    @auction = Auction.find(params[:auction_id])
    @auction.start
    redirect_to administration_auction_path(@auction)
  end

  def wait_for_active_users
    @auction = Auction.find(params[:auction_id])
    @auction.wait_for_active_users
    redirect_to administration_auction_path(@auction)
  end

  def reach_lowest_price
    @auction = Auction.find(params[:auction_id])
    @auction.reach_lowest_price
    redirect_to administration_auction_path(@auction)
  end

  def terminate
    @auction = Auction.find(params[:auction_id])
    @auction.terminate
    redirect_to administration_auction_path(@auction)
  end

  def sell_out
    @auction = Auction.find(params[:auction_id])
    @auction.sell_out
    redirect_to administration_auction_path(@auction)
  end

end