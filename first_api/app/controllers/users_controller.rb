class UsersController < ApplicationController

    def index
        render plain: "Nothing!!!"
    end

    def create
        render json: params
    end

    def show
        render json: params
    end
    
end