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
        render json: "You need to build an new.html.erb view to render here. Comment out line 23 in the users_controller.rb and comment in the line 24 to see a helpful error message"
        # render :new
    end

    def create
        @answer = Answer.new(answer_params)
        @answer.user_id = 9 # hardcoded for now
        @answer.question_id = 6 # hardcoded for now
        if @answer.save
            redirect_to answer_url(@answer)
        else
            render json: @answer.errors.full_messages, status: 422
        end
    end

    def edit
        @answer = Answer.find(params[:id])
        @question = Question.find(params[:id])
        render json: "You need to build an edit.html.erb view to render here. Comment out line 40 in the users_controller.rb and comment in the line 41 to see a helpful error message"
        # render :edit
    end

    def update
        @answer = Answer.find(params[:id])
        if @answer.update(answer_params)
            redirect_to answer_url(@answer)
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
        params.require(:answer).permit(:body)
    end
end
