class ThingsController < ApplicationController

  autocomplete :thing, :name, full: false

  # POST /set_knowledge
  def set_knowledge


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
end
