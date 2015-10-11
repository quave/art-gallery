class MainController < ApplicationController

  def landing
    @categories = Category.all
    @works = Work.includes(:category).shown
  end

  def info
    render :info
  end

end
