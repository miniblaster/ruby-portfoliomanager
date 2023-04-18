class Balance < ApplicationRecord
  belongs_to :account
  belongs_to :exchange_rate

  def account_name
    account.name
  end
end
