class HomesController < ApplicationController
  require_relative "portland_maps.rb"

  def index
    @address = params["address"]
  end
end
