class UsersController < ApplicationController

    def index
        @users = User.all

        render json: @users
    end 

    def show 
        @user = User.find_by(id: params[:id])

        if @user
            render json: @user
        else
            render json: @user.errors.full_messages, status: 404
        end
    end

end
