class Api::RestaurantsController < ApplicationController
  before_action :require_signed_in!
  def index
    @restaurants = Restaurant.includes(:reviews).all
    render :index
  end

  def show
    @restaurant = Restaurant.includes(:reviews).find(params[:id])
    render :show
  end
end
