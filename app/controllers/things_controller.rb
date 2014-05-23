class ThingsController < ApplicationController

  autocomplete :thing, :name, full: false

  # POST /set_knowledge
  def set_knowledge
    @user = User.first

    save_knowledge

    redirect_to :back
  end

  # GET /get_knowledge
  def get_knowledge
    @users_results = [User.first]

    redirect_to :back
  end

  private

  def thing_params
    params.require(:thing_names)
  end

  def save_knowledge
    @user.things = Thing.from_string(thing_params)
  end
end
