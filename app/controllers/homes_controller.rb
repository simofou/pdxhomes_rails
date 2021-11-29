class HomesController < ApplicationController
  
  def index
    redirect_to root_path
  end

  def create
    address = params["home"]["address"]
    @home = Home.new(address)
  end
end
