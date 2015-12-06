class LoansController < ApplicationController
  before_action :authenticate_user!
  before_action :set_loan, only: [:show, :edit, :update, :destroy, :issue_loan]
  before_action :set_client, only: [:create]
  authorize_resource

  def index
  end

  def show
  end

  def new
    @loan = Loan.new
  end

  def edit
  end

  def create
    @loan = Loan.new(loan_params)
    @loan.client = @client
    @loan.count_total_sum
    if @loan.save
      redirect_to issue_loan_client_path(@client), notice: 'Займ создан'
    else
      render :new
    end
  end

  def update
    @client = @loan.client
    if @loan.update(loan_params)
      @loan.count_total_sum && @loan.save
      redirect_to issue_loan_client_path(@client), notice: 'Займ обновлен'
    else
      render :edit
    end
  end

  # def destroy
  #   @loan.destroy
  #   redirect_to loans_url, notice: 'Займ удален'
  # end

  private

    def set_client
      @client = Client.find(params[:client_id])
    end

    def set_loan
      @loan = Loan.find(params[:id])
    end

    def loan_params
      params.require(:loan).permit(:sum, :date_issue, :end_loan )
    end
end

