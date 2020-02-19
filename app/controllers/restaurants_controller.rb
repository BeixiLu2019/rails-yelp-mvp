class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end
  def show
    @restaurant = Restaurant.find(params[:id])
  end
  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.create(restaurant_params)
    redirect_to restaurant_path(@restaurant)
  end

 private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :category, :reviews, :phone_number)
  end

end

# A visitor can see the list of all restaurants.
# GET "restaurants"
# She/He can add a new restaurant, and be redirected to the show view of that new restaurant.
# GET "restaurants/new"
# POST "restaurants"
# She/He can see the details of a restaurant, with all the reviews related to the restaurant.
# GET "restaurants/38"
