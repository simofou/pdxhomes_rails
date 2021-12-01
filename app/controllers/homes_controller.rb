class HomesController < ApplicationController
  
  def index
    redirect_to root_path
  end

  def new
    @home = Home.new
  end

  def create
    address = params["home"]["address"]
    @home = Home.new(address)
    
    if @home.valid?
      render 'create'
    else
      render 'new'
    end
  end
end
