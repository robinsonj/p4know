class ThingsController < ApplicationController

  autocomplete :thing, :name, full: false

  # POST /set_knowledge
  def set_knowledge

    save_knowledge

    render :refresh
  end

  # GET /get_knowledge
  def get_knowledge


    render :refresh
  end

  private

  def thing_params
    params.require()
  end

  def save_knowledge
    @user.things = Thing.from_string(thing_params)
  end
end
