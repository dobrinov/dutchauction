class UsersController < ApplicationController

  before_filter :require_login, only: ['show', 'edit', 'update']

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new params[:user]

    if @user.save
      log_in(@user)
      redirect_to user_path
    else
      flash.now[:error] = 'Invalid form data'
      render :action => 'new'
    end
  end

  def edit
  end

  def update
  end

end