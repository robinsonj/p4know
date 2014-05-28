class SessionsController < ApplicationController

  # POST /sessions/create
  def create
    @user = User.find_or_create_by(name: user_name_param)

    if @user.authenticate(user_password_param)
      session[:user] = @user

      flash[:info] = 'Logged in.'
      redirect_to :back
    else
      flash[:error] = 'Failed login attempt.'
      redirect_to :back
    end
  end

  # POST /sessions/destroy
  def destroy
    session[:user] = nil
    redirect_to :back, notice: 'Logged out.'
  end

  private

  def user_name_param
    params.require(:username)
  end

  def user_password_param
    params.require(:password)
  end
end
