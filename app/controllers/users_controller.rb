class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

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
        redirect_to @users, notice: 'users was successfully created.'
      else
        render :new
      end
  end

  def update
    if user_params[:password].blank?
      user_params.delete(:password)
      user_params.delete(:password_confirmation)
    end
    # https://github.com/plataformatec/devise/wiki/How-To%3a-Allow-users-to-edit-their-account-without-providing-a-password
    successfully_updated = if needs_password?(@user, user_params)
                             @user.update(user_params)
                           else
                             @user.update_without_password(user_params)
                           end

    if successfully_updated
        redirect_to @user, notice: 'users was successfully updated.'
    else
        render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_url, notice: 'users was successfully destroyed.'
  end

  private
    def set_user
      @user = User.try(:find, params[:id])
    end

    def user_params
      params.require(:user).permit(:login, :password, :name, :surname, :patronymic, :territory, :phone)
    end

    def needs_password?(user, params)
      params[:password].present?
    end

end
