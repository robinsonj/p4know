class HomeController < ApplicationController

  def index
    render locals: {
      user_things:  set_user_things,
      results:      set_local_results
    }
  end

  private

  def set_user_things
    user_signed_in? ? current_user.things.sort_by { |e| e.name.downcase } : nil
  end

  def set_local_results
    results = Thing.from_string(session[:thing_names] || '')
    session[:thing_names] = nil
    results
  end
end
