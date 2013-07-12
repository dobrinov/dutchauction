class SessionsController < ApplicationController

  before_filter :require_login, only: ['destroy']

  def new
  end

  def create
    user = User.find_by_email(params[:email])

    if user && user.authenticate(params[:password])
      log_in(user)
      redirect_to back_or_default(user_path), notice: 'Signed in!'
    else
      flash.now[:error] = 'Invalid email or password'
      render 'new'
    end
  end

  def destroy
    @_current_user = session[:current_user_id] = nil
    redirect_to root_path, notice: 'Signed out!'
  end

end