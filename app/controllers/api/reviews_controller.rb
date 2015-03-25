class Api::ReviewsController < ApplicationController
  before_action :require_signed_in!

  def create
    @review = current_user.reviews.new(review_params)

    if @review.save
      render json: @review
    else
      render json: @review.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update
    @review = current_user.reviews.find(params[:id])

    if @review.update_attributes(review_params)
      render json: @review
    else
      render json: @review.error.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    render json: {}
  end

  private
  def review_params
    params.require(:review).permit(:body, :user_id, :restaurant_id, :rating)
  end
end
