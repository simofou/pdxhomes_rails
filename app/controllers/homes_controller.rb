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

    if !@home.valid?
      render 'new'
    elsif @home.valid? && @home.owner.nil?
      @home.errors.add :base, "address not in pdx database"
      render 'new'
    else
      render 'create'
    end
  end
end
