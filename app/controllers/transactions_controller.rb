class TransactionsController < ApplicationController
   before_action :set_transaction, only: [:show]
  def new
    @ski = Ski.find(params[:ski_id])
    @transaction = Transaction.new
  end

  def create
    @transaction = Transaction.new(transaction_params)
    @ski = Ski.find(params[:ski_id])
    @transaction.ski = @ski
    @transaction.customer = current_user
    if @transaction.save
      redirect_to transaction_path(@transaction)
    else
      render "skis/show"
    end
  end

  def index
    @earning_transactions = current_user.earning_transactions
    @transactions = current_user.transactions
  end

  def show

  end

  private

  def transaction_params
    params.require(:transaction).permit(:rental_date)
  end

  def set_transaction
    @transaction = Transaction.find(params[:id])
  end
end
