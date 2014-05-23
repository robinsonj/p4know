class ThingsController < ApplicationController

  autocomplete :thing, :name, full: false
end
