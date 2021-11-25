class WelcomeController < ApplicationController
  def index
    @home = Home.new()
  end
end
  
