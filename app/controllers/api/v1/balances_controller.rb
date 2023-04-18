class Api::V1::BalancesController < ApplicationController
  def index
    balances = Balance.all.order(balance_date: :asc)
    render json: balances
  end

  def create
  end

  def destroy
  end
end
