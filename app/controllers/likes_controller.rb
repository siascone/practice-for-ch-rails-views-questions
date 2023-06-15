class LikesController < ApplicationController

    def create
        @like = Like.new
        @like.user_id = current_user.id
        @like.answer_id = params[:id]
        unless @like.save
            flash[:errors] = @like.errors.full_messages
        end
        redirect_to answer_url(params[:id])
    end

    def destroy
        @like = Like.find(params[:id])
        @like.destroy
        redirect_to answer_url(@like.answer_id)
    end
end
