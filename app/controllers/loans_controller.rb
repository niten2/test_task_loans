class LoansController < ApplicationController
  before_action :set_loan, only: [:show, :edit, :update, :destroy, :issue_loan]

  def index
    # @loans = loan.all
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
    if @loan.save
      redirect_to @loan, notice: 'loan was successfully created.'
    else
      render :new
    end
  end

  def update
    if @loan.update(loan_params)
      redirect_to @loan, notice: 'loan was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @loan.destroy
    redirect_to loans_url, notice: 'loan was successfully destroyed.'
  end

  private
    def set_loan
      @loan = Loan.find(params[:id])
    end

    def loan_params
      params.require(:loan).permit(:sum )
    end

end

