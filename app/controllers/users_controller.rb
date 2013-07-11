class UsersController < ApplicationController

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new params[:user]

    if @user.save
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