class WelcomeController < ApplicationController
  def index
    @home = Home.new()
  end

  def create
    # this is where we could do stuff on "create" when we submit
    # @home.update address: address or wtv?
  end
end
  
