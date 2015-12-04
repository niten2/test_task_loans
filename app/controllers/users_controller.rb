class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
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
      if @user.update(user_params)
        redirect_to @user, notice: 'users was successfully updated.'
      else
        render :edit
      end
  end

  # def destroy
    # @user.destroy
    # redirect_to users_url, notice: 'users was successfully destroyed.'
  # end

  private
    def set_user
      # @user = User.try(:find, params[:id])
    end

    def user_params
      params.require(:user).permit(:login, :password, :name, :surname, :patronymic, :territory, :phone)
    end
end
