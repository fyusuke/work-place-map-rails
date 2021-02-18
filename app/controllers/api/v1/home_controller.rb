class Api::V1::HomeController < ApplicationController

  # for test
  def index
    render json: {msg: 'success!'}, status: 200
  end
end
