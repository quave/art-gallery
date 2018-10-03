class MainController < ApplicationController
  before_action :set_categories

  def landing
    @active_category = Category.find_by_name_lat(params[:category])
    @works = if @active_category
      Work.includes(:category).where(category_id: @active_category.id).shown
    else
      Work.includes(:category).shown
    end
  end

  def info
    render :info
  end

  private

  def set_categories
    @categories = Category.all
  end

end
