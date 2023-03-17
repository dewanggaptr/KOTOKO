class Api::TransactionsController < ApplicationController
  before_action :set_transaction, only: :destroy

  def index
    @transaction = Transaction.all

    render json: @transaction.map { |transaction| transaction.new_attributes }
  end

  def create
    @transaction = Transaction.new(cashier_id: @current_user.id)

    if @transaction.save
      render json: @transaction.new_attributes, status: 201
    else
      render json: @transaction.errors, status: 422
    end
  end

  def destroy
    @transaction.destroy

    render json: { success: "Success delete transaction" }, status: 200
  end

  private
    def set_transaction
      @transaction = Transaction.find_by_id(params[:id])
      if @transaction.nil?
        render json: { error: "Transaction not found" }, status: 404
      end
    end

    def transaction_params
      params.require(:transaction).permit(:cashier_id)
    end
end
