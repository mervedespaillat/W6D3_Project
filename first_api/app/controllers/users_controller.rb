require "byebug"
class UsersController < ApplicationController

    def index
        render json: User.all
    end

    def create
        # debugger
        @user = User.new(user_params)
        #Is it necessary to do equivalent of @chirp.author? We did not do here, it was fine.
        if @user.save
            redirect_to user_url(@user)
            # render json: @user
            #Q: How does this work Ruby wise, passing in @instance to the _url shortcut?
            #e.g. redirect_to chirp_url(@chirp)
        else
            render json: @user.errors.full_messages, status: :unprocessable_entity
        end
        
    end

    def show
        @user = User.find(params[:id])
        render json: @user
    end
    
    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            redirect_to user_url(@user)
        else
             render json: @user.errors.full_messages, status: :unprocessable_entity
        end
    end
     
    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to users_url
        # render json: @user
    end

    private

    def user_params
        params.require(:user).permit(:username)
    end
    

end