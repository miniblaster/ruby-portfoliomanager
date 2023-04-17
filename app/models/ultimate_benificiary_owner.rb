class UltimateBenificiaryOwner < ApplicationRecord
  has_and_belongs_to_many :accounts

  def portfolio
    accounts
  end
end
