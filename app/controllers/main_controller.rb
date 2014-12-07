class MainController < ApplicationController

  def landing
    @categories = Category.all
    @works = Work.includes(:category).all
  end

end
