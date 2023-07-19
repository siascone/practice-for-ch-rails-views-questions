class QuestionsController < ApplicationController
    def index
        @questions = Question.all
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
        render json: "You need to build an new.html.erb view to render here. Comment out line 22 in the users_controller.rb and comment in the line 23 to see a helpful error message"
        # render :new
    end

    def create
        @question = Question.new(question_params)
        @question.user_id = 9 # hard coded as we have yet to impliment auth and 
                              # current user
        if @question.save
            redirect_to question_url(@question)
        else
            render json: @question.errors.full_messages, status: 422
        end
    end

    def edit
        @question = Question.find(params[:id])
        render json: "You need to build an edit.html.erb view to render here. Comment out line 38 in the users_controller.rb and comment in the line 39 to see a helpful error message"
        # render :edit
    end

    def update
        @question = Question.find_by(id: params[:id])
        if @question.update(question_params)
            redirect_to question_url(@question)
        else
            render json: @question.errors.full_messages, status: 422
        end
    end

    def destroy
        @question = Question.find_by(id: params[:id])
        if @question.destroy
            redirect_to questions_url
        else
            render plain: "You can't destroy what's not there."
        end
    end

    private

    def question_params
        params.require(:question).permit(:body, :subject)
    end

end
