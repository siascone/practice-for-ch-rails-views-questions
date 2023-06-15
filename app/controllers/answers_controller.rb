class AnswersController < ApplicationController

    def index
        @answers = if params[:user_id]
                        Answer.where(user_id: params[:user_id])
                    else
                        Answer.all
                    end
        render json: @answers
    end

    def show
        @answer = Answer.find(params[:id])
        if @answer
            render json: @answer
        else
            render json: @answer.errors.full_messages, status: 404
        end
    end
    
    def new
        @answer = Answer.new
        render json: "New Answer form to be rendered as :new view"
    end

    def create
        @answer = Answer.new(chirp_params)
        @answer.user_id = current_user.id # TODO fix this for non auth
        if @answer.save
            redirect_to question_url(@answer)
        else
            render json: @answer.errors.full_messages, status: 422
        end
    end

    def edit
        @answer = Answer.find(params[:id])
        render json: "Edit form to be rendered as :edit view"
    end

    def update
        @answer = Answer.find(params[:id])
        if @answer.update(chirp_params)
            redirect_to question_url(@answer)
        else
            render json: @answer.errors.full_messages, status: 422
        end
    end

    def destroy
        @answer = Answer.find(params[:id])
        if @answer.destroy
            redirect_to answers_url
        else
            render plain: "You can't destroy what's not there."
        end
    end

    private

    def answer_params
        params.require(:answer).permit(:body, :user_id)
    end
end
