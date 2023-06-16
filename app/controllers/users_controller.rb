class UsersController < ApplicationController

    def index
        @users = User.all

        render json: @users
    end 

    def show 
        @user = User.find(params[:id])

        if @user
            render json: @user
        else
            render json: @user.errors.full_messages, status: 404
        end
    end

    def new
        @user = User.new
        render json: "You need to build an new.html.erb view to render here. Comment out line 21 in the users_controller.rb and comment in the line 22 to see a helpful error message"
        # render :new
    end

    def create
        @user = User.new(user_params)

        if @user.save
            redirect_to user_url(@user)
        else
            render json: @user.errors.full_messages, status: 422
        end
    end

    def edit
        @user = User.find(params[:id])
        render json: "You need to build an edit.html.erb view to render here. Comment out line 37 in the users_controller.rb and comment in the line 38 to see a helpful error message"
        # render :edit
    end

    def update
        @user = User.find(params[:id])

        if @user.update(user_params)
            redirect_to user_url(@user)
        else
            # if record not found this line wont hit
            render json: @user.errors.full_messages, status: 422
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :email)
    end

end
