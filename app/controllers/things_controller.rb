class ThingsController < ApplicationController

  # before_action :authenticate_user!, only: [:set_knowledge]

  autocomplete :thing, :name, full: false

  # POST /set_knowledge
  def set_knowledge
    save_knowledge

    redirect_to :back
  end

  # GET /get_knowledge
  def get_knowledge
    session[:thing_names] = thing_params

    redirect_to :back
  end

  private

  def thing_params
    params.require(:thing_names)
  end

  def save_knowledge
    current_user.things << Thing.from_string(thing_params)
  end
end
