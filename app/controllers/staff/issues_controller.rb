class Staff::IssuesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_issue, only: %i[show edit update destroy]

  def index
    authorize! :read, Issue
    @issues = Issue.all
  end

  def show
    authorize! :read, @issue
  end

  def edit
    authorize! :update, @issue
  end

  def update
    authorize! :update, @issue
    if @issue.update(issue_params)
      redirect_to root_path, notice: 'Incidente atualizado.'
    else
      redirect_to staff_issue_path(@issue), alert: 'Não foi possível atualizar incidente.'
    end
  end

  def destroy
    authorize! :update, @issue
    if @issue.update(status: :closed)
      redirect_to root_path, notice: 'Incidente fechado.'
    else
      redirect_to staff_issue_path(@issue), alert: 'Não foi possível fechar incidente.'
    end
  end

  private

  def find_issue
    @issue = Issue.find(params[:id])
  end

  def issue_params
    params.require(:issue).permit(:status, :priority)
  end
end
