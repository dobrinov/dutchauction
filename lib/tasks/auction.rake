namespace :auction do

  desc "Rake taks managing the auction state and updates"
  task :manage do

    loop do

      Auction.where(state: ['running', 'scheduled', 'waiting_for_active_users']).each do |auction|

        # Start scheduled tasks
        if auction.scheduled? && auction.start_datetime <= Time.now
          auction.start
          auction.auction_participations.registered.map(&:activate)
        end

        if auction.running?

          # Check auction active users restrictions
          if auction.minimum_active_users_count > auction.active_users_count
            auction.wait_for_active_users
            auction.wait_for_active_users_until = Time.now + auction.active_users_timeout.seconds
            auction.save!
          end

          # Update auction current price
          if auction.next_price_reduce_at.nil?
            auction.next_price_reduce_at = Time.now + auction.price_reduce_pace.seconds
            auction.save!
          end

          if auction.next_price_reduce_at <= Time.now
            auction.current_price = auction.current_price - auction.price_reduce_amount
            auction.next_price_reduce_at = Time.now + auction.price_reduce_pace.seconds
            auction.save!
          end

          # Check auction price restrictions
          if auction.current_price <= auction.end_price
            auction.current_price = auction.end_price
            auction.reach_lowest_price
          end

          # Check quantity
          # Will be done in the model?

        end

        if auction.waiting_for_active_users?
          if auction.minimum_active_users_count <= auction.active_users_count
            auction.start
          end

          if auction.wait_for_active_users_until < Time.now
            auction.terminate
          end
        end

      end

      sleep 1
    end

  end

end