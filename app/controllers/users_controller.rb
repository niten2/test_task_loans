class UsersController < ApplicationController
  # before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  authorize_resource

  def lock
    @user = User.find(params[:id])
    @user.lock_access!
    redirect_to users_path
  end

  def unlock
    @user = User.find(params[:id])
    @user.unlock_access!
    redirect_to users_path
  end

  def index
    @users = User.all
    @clients = Client.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @users = User.new(user_params)
      if @users.save
        redirect_to @users, notice: 'Менеджер создан'
      else
        render :new
      end
  end

  def update
    if user_params[:password].blank?
      user_params.delete(:password)
      user_params.delete(:password_confirmation)
    end

    successfully_updated = if needs_password?(@user, user_params)
                             @user.update(user_params)
                           else
                             @user.update_without_password(user_params)
                           end

    if successfully_updated
        redirect_to @user, notice: 'Менеджер обновлен'
    else
        render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_url, notice: 'Менеджер удален'
  end

  private
    def set_user
      # binding.pry
      # @user = User.try(:find, params[:id])
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:login, :password, :name, :surname, :patronymic, :territory, :phone)
    end

    def needs_password?(user, params)
      params[:password].present?
    end
end
