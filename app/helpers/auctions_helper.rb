module AuctionsHelper

  def state_message_for(auction)
    if logged_in?
      if current_user.registered_for?(auction)
        if true # Add user active in auction check
          authorized_message_for(auction.state)
        else
          'Your participation in this auction has ended.'
        end
      else
        unauthorized_message_for(auction.state)
      end
    else
      unauthorized_message_for(auction.state)
    end
  end

  def authorized_message_for(state)
    case state
    when 'unscheduled'
      'Auction still not scheduled.'
    when 'scheduled'
      'Registered for auction. Waiting to start...'
    when 'running'
      'Auction running...'
    when 'waiting_for_active_users'
      'Waiting for active users ...'
    when 'reached_lowest_price'
      'Auction closed. Product lowest price reached.'
    when 'sold_out'
      'Auction closed. Product sold out.'
    when 'terminated'
      'Auction closed.'
    end
  end

  def unauthorized_message_for(state)
    case state
    when 'unscheduled'
      'Auction not scheduled.'
    when 'scheduled'
      'Registering for auction ...'
    when 'running'
      'Auction is running ...'
    when 'waiting_for_active_users'
      'Auction is running ...'
    when 'reached_lowest_price'
      'Auction closed.'
    when 'sold_out'
      'Auction closed.'
    when 'terminated'
      'Auction closed.'
    end
  end

end