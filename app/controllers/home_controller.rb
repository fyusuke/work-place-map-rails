class HomeController < ApplicationController

    # this is required for AWS ALB heath check
    def index
        render status: 200
    end
end
