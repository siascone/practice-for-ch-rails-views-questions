class QuestionsController < ApplicationController
    def index
        @questions = if params[:user_id]
                        Question.where(user_id: params[:user_id])
                    else
                        Question.all
                    end
        render json: @questions
    end

    def show
        @question = Question.find(params[:id])
        if @question
            render json: @question
        else
            render json: @question.errors.full_messages, status: 404
        end
    end
    
    def new
        @question = Question.new
        render json: "New Question form to be rendered as :new view"
    end

    def create
        @question = Question.new(chirp_params)
        @question.user_id = current_user.id # TODO fix this for non auth
        if @question.save
            redirect_to question_url(@question)
        else
            render json: @question.errors.full_messages, status: 422
        end
    end

    def edit
        @question = Question.find(params[:id])
        render json: "Edit form to be rendered as :edit view"

    end

    def update
        @question = Question.find(params[:id])
        if @question.update(chirp_params)
            redirect_to question_url(@question)
        else
            render json: @question.errors.full_messages, status: 422
        end
    end

    def destroy
        @question = Question.find(params[:id])
        if @question.destroy
            redirect_to questions_url
        else
            render plain: "You can't destroy what's not there."
        end
    end

    private

    def answer_params
        params.require(:question).permit(:body, :user_id)
    end

end
