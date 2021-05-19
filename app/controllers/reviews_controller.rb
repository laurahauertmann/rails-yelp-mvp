class ReviewsController < ApplicationController

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review.restaurant = @restaurant # set the review's restaurant_id

    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      # show form errors
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end

end
