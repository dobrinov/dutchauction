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

  def stop
    @auction = Auction.find(params[:auction_id])
    @auction.stop
    redirect_to administration_auction_path(@auction)
  end

  def pause
    @auction = Auction.find(params[:auction_id])
    @auction.pause
    redirect_to administration_auction_path(@auction)
  end

  def finish
    @auction = Auction.find(params[:auction_id])
    @auction.finish
    redirect_to administration_auction_path(@auction)
  end

end