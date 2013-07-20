namespace :auction do

  desc "Rake taks managing the auction state and updates"
  task :manage do
    loop do

      # Start scheduled tasks
      auctions = Auction.where(["start_datetime <= ? AND state = ?", Time.now, 'scheduled'])
      auctions.each { |auction| auction.start }

      # Update running tasks
      running_auctions = Auction.where(state: 'running')

      running_auctions.each do |auction|
        auction.current_price = auction.current_price - 0.1
        auction.save!
      end

      sleep 1
    end
  end

end