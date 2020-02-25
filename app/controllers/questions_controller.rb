class QuestionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  
  def index
    # @questions = Question.all
    @questions = Question.search(params[:search])
    render layout: "application_login"
  end

  def show
    @answer = Answer.new
    render layout: "application_login"
  end

  def new
    @question = Question.new
    render layout: "application_login"
  end
  
  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to root_path, notice: '投稿しました。'
    else
      flash[:alert] = '失敗しました。'
      render :new
    end
  end

  def edit
    render layout: "application_login"
  end
  
  def update
    if @question.update(question_params)
      redirect_to root_path, notice: '更新しました。'
    else
      flash[:alert] = '失敗しました。'
      render :edit
    end
  end
  
  def destroy
    @question.destroy
    redirect_to root_path, notice: '削除しました。'
  end
  
  private
    def set_question
      @question = Question.find(params[:id])
    end
  
    def question_params
      params.require(:question).permit(:name, :title, :content)
    end
end
