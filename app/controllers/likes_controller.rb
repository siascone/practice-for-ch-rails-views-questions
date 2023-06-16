class LikesController < ApplicationController

    def create
        @like = Like.new
        @like.user_id = 9 # hard coded as we have yet to impliment auth and 
                          # current user
        @like.answer_id = params[:id]

        unless @like.save
            render json: @like.errors.full_messages, status: 422
        end

        redirect_to answer_url(params[:id])
    end

    def destroy
        @like = Like.find(params[:id])
        @like.destroy
        redirect_to answer_url(@like.answer_id)
    end
end
