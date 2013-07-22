namespace :auction do

  desc "Rake taks managing the auction state and updates"
  task :manage do

    loop do

      # Start scheduled tasks
      Auction.where(["start_datetime <= ? AND state = ?", Time.now, 'scheduled']).each do |auction|
        auction.start

        # Activate registered users
        auction.auction_participations.registered.map(&:activate)
      end

      # Update running tasks
      Auction.where(state: 'running').each do |auction|
        # Update states
        if auction.current_price <= auction.end_price
          auction.current_price = auction.end_price
          auction.reach_lowest_price
        end

        if auction.minimum_active_users_count > auction.active_users_count
          auction.wait_for_active_users
          auction.wait_for_active_users_until = Time.now + auction.active_users_timeout.seconds
          auction.save!
        end

        # Update current price
        if auction.running?
          auction.current_price = auction.current_price - 0.1
          auction.save!
        end

        # Update quantity
        # It will be updated on purchase

      end

      # Update waiting for users tasks
      Auction.where(state: 'waiting_for_active_users').each do |auction|
        if auction.minimum_active_users_count <= auction.active_users_count
          auction.start
        end

        if auction.wait_for_active_users_until < Time.now
          auction.terminate
        end
      end

      sleep 1
    end

  end

end