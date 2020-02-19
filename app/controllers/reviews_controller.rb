class ReviewsController < ApplicationController
  # def index

  #  end
  #  def show

  #  end
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end
  def create
    @review = Review.create(review_params)
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review.restaurant = @restaurant
    redirect_to restaurant_path(@restaurant)
  end

  private
    def review_params
      params.require(:review).permit(:content, :rating)
    end
end

# GET "restaurants/38/reviews/new"
# POST "restaurants/38/reviews"
