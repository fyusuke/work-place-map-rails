class Api::V1::ContactUsFormsController < ApplicationController
  before_action :set_user, only: [:create]

  # TODO emailを送ること, Twitter認証はemail情報を提供しないので注意
  def create
    @user.contact_us_forms.create(message: contact_us_form_params[:message])
    logger.debug('ContactUsForm is created')
    render status: 200
  end

    private

    def contact_us_form_params
      params.require(:contact_us_form).permit(:message, :firebase_uid)
    end

    def set_user
      @user = User.find_by(firebase_uid: params[:firebase_uid])
      unless @user.present?
        logger.debug("user is not found")
        render status: 400
      end
    end
end
