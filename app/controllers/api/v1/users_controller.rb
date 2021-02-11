class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:show, :destroy]

  # TODO accept only Vue app conn
  def create
    user = User.new(user_params)
    if user.save
      logger.debug("User is created")
      render json: { userId: user.id }, status: 200
    else
      logger.debug("Error: #{user.errors.full_messages}")
      render json: { message: user.errors.full_messages }, status: 400
      # render json: { status: 400, data: post.errors }
    end
  end

  def show
    data = { name: @user.name, email: @user.email }
    render json: { user: data }, status: 200
  end

  # def update
  #   if @user.update(user_params)
  #     logger.debug("User is updated")
  #     render status: 200
  #   else
  #     logger.debug(user.errors.full_messages)
  #     render status: 400
  #   end
  # end

  def destroy
    @user.destroy
    logger.debug("User is destroyed")
    render status: 200
  end

    private

    def set_user
      @user = User.find_by(firebase_uid: params[:firebase_uid])
      unless @user.present?
        logger.debug(@user.errors.full_messages)
        render status: 400
      end
    end

    def user_params
      params.require(:user).permit(:name, :email, :firebase_uid)
    end

end