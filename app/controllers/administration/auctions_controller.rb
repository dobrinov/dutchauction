class Administration::AuctionsController < Administration::CommonController

  def index
    @auctions = Auction.all
  end

  def show
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

end