class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_management
  before_action :find_user, only: %i[show edit update destroy]

  def index
    @users = User.staff
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params.merge(role: :staff))
    if @user.save
      render :show
    else
      flash.now[:alert] = @user.errors.full_messages
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to admin_root_path, notice: 'Usuário atualizado.'
    else
      flash.now[:alert] = @user.errors.full_messages
      redirect_to admin_root_path
    end
  end

  def destroy
    if @user.destroy
      redirect_to admin_root_path, notice: 'Usuário deletado.'
    else
      redirect_to admin_root_path, alert: 'Não foi possível deletar o usuário.'
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

  def find_user
    @user = User.find(params[:id])
  end

  def authorize_management
    authorize! :manage, User
  end
end
