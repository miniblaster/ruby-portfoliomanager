class Api::V1::AccountsController < ApplicationController
  def index
    accounts = Account.all
    if params["start_date"].present?
      accounts = accounts.joins(:balances).where("balances.balance_date >= ?", Time.new(params["start_date"]))
    end
    if params["end_date"].present?
      accounts = accounts.joins(:balances).where("balances.balance_date <= ?", Time.new(params["end_date"]))
    end
      
    render json: accounts.group("accounts.id").order(name: :asc)
  end

  def create
  end

  def destroy
  end
end
