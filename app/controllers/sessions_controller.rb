class SessionsController < ApplicationController
  def create
  end

  def destroy
    session[:user] = nil
    redirect_to :back, notice: 'Logged out.'
  end
end
