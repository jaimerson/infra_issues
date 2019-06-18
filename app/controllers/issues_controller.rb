class IssuesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_issue, only: %i[show edit update destroy reopen]

  def index
    @issues = current_user.issues
  end

  def show
    authorize! :read, @issue
  end

  def new
    @issue = Issue.new
  end

  def create
    @issue = Issue.new(issue_params.merge(reporter: current_user))
    if @issue.save
      redirect_to @issue
    else
      flash.now[:alert] = @issue.errors.full_messages
      render :new
    end
  end

  def edit
    authorize! :update, @issue
  end

  def destroy
    authorize! :destroy, @issue
    @issue.update(status: Issue.statuses[:closed])
    render :show
  end

  def update
    authorize! :update, @issue

    if @issue.update(issue_params)
      redirect_to @issue
    else
      flash.now[:alert] = @issue.errors.full_messages
      render :edit
    end
  end

  def reopen
    authorize! :update, @issue

    if @issue.update(status: :open)
      redirect_to root_path, notice: 'Incidente reaberto.'
    else
      redirect_to root_path, alert: 'Não foi possível reabrir o incidente.'
    end
  end

  private

  def issue_params
    params.require(:issue).permit(:title, :description, :location_id)
  end

  def find_issue
    @issue = Issue.find(params[:id])
  end
end
