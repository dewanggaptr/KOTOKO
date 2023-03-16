class Api::CashiersController < ApplicationController
  skip_before_action :authenticate_request, only: [:create, :login]
  before_action :set_cashier, only: [:show, :update, :destroy]

  def index
    @cashiers = Cashier.all

    render json: @cashiers.map { |cashier| cashier.new_attributes }
  end

  def show
    render json: @cashier.new_attributes
  end

  def create
    @cashier = Cashier.new(cashier_params)
      if @cashier.save
        render json: @cashier.new_attributes, status: 201
      else
        render json: @cashier.errors, status: 422
      end
  end

  def update
    if @cashier.update(cashier_params)
      render json: @cashier.new_attributes
    else
      render json: @cashier.errors, status: 422
    end
  end

  def destroy
    @cashier.destroy
  end

  def login
    @cashier = Cashier.find_by(email: params[:email])
    if @cashier&.authenticate(params[:password])
      token = JsonWebToken.encode(cashier_id: @cashier.id)
      render json: {
        cashier: @cashier.new_attributes,
        token: token
      }
    else
      render json: { error: "Invalid email or password" }, status: 401
    end
  end

  private
  def set_cashier
    @cashier = Cashier.find_by_id(params[:id])
    if @cashier.nil?
      render json: { error: "user not found" }, status: 404
    end
  end

  def cashier_params
    params.require(:cashier).permit(:name, :email, :password)
  end
end
