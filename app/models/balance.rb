class Balance < ApplicationRecord
  belongs_to :account
  belongs_to :exchange_rate
end
