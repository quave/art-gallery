class MainController < ApplicationController

  def landing
    @categories = Category.all
  end

end
