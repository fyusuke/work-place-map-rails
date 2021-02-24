class Api::V1::ReviewsController < ApplicationController
  before_action :set_user, only: [:create, :destroy]

  def create
    place = Place.find_or_create_by(gmap_place_id: params[:gmap_place_id])

    if Review.find_by(place_id: place.id, user_id: @user.id)
      logger.debug("Review is created!")
      render status: 403
      return
    end

    review = Review.new(
      user_id: @user.id, 
      place_id: place.id, 
      comment: params[:comment], 
      rating: params[:rating]
    )
    logger.debug(review.inspect)
    if review.save
      logger.debug("Review is created!")
      render status: 200
    else
      logger.debug("Error: #{review.errors.full_messages}")
      render status: 500
    end
  end

  def destroy
    review = Review.find(params[:id])
    review.destroy
    logger.debug("Review is destroyed")
    render status: 200
  end

    private

    # def review_params
    #   params.require(:review).permit(:gmap_place_id, :comment, :rating)
    # end

    def set_user
      @user = User.find_by(firebase_uid: params[:firebase_uid])
      unless @user.present?
        logger.debug("user is not found")
        render status: 400
      end
    end
end
