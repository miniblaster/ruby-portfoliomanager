class Account < ApplicationRecord
  belongs_to :currency
  has_and_belongs_to_many :ultimate_benificiary_owners
  has_and_belongs_to_many :tags
  has_many :balances
end
