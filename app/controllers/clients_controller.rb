class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy, :issue_loan]

  def issue_loan
    @loan =  Loan.new
  end

  def index
    @clients = Client.all
  end

  def show
  end

  def new
    @user = current_user
    @client = current_user.clients.new
  end

  def edit
  end

  def create
    @client = Client.new(client_params)
    @client.user = current_user
    if @client.save
      redirect_to @client, notice: 'Client was successfully created.'
    else
      render :new
    end
  end

  def update
    if @client.update(client_params)
      redirect_to @client, notice: 'Client was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @client.destroy
    redirect_to user_clients_url(current_user), notice: 'Client was successfully destroyed.'
  end

  private
    def set_client
      @client = Client.find(params[:id])
    end

    def client_params
      params.require(:client).permit(:name, :surname, :patronymic, :territory, :phone, :email, :passport)
    end
end
