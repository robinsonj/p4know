module ApplicationHelper

  def current_user
    session[:user]
  end

  def user_signed_in?
    true if session[:user] != nil
  end
end
