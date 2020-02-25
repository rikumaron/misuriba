class AnswersController < ApplicationController
  
  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new
    if @answer.update(answer_params)
      redirect_to question_path(@question), notice: '投稿しました。'
    else
      redirect_to question_path(@question), alert: '失敗しました。'
    end
  end
  
  def edit
    @question = Question.find(params[:question_id])
    @answer = @question.answers.find(params[:id])
    render layout: "application_login"
  end
  
  def update
    @question = Question.find(params[:question_id])
    @answer = @question.answers.find(params[:id])
    if @answer.update(answer_params)
      redirect_to question_path(@question), notice: '更新しました。'
    else
      flash[:alert] = '失敗しました。'
      render :edit
    end
  end
  
  def destroy
    @question = Question.find(params[:question_id])
    @answer = @question.answers.find(params[:id])
    @answer.destroy
    redirect_to question_path(@question), notice: '回答を削除しました。'
  end
  
  private
  def answer_params
    params.require(:answer).permit(:content, :name, :question_id)
  end
end
