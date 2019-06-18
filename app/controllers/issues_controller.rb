class IssuesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_issue, only: %i[show edit update destroy]

  def index
    @issues = Issue.all
  end

  def show
  end

  def new
    @issue = Issue.new
  end

  def create
    if @issue = Issue.create(issue_params)
      redirect_to @issue
    else
      render :new
    end
  end

  def edit
  end

  def destroy
    @issue.update(status: Issue.statuses[:closed])
    render :show
  end

  def update
    if @issue.update(issue_params)
      redirect_to @issue
    else
      render :edit
    end
  end

  private

  def issue_params
    params.require(:issue).permit(:title, :description)
  end

  def find_issue
    @issue = Issue.find(params[:id])
  end
end
