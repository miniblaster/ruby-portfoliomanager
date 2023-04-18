class BalanceSerializer < ActiveModel::Serializer
  attributes :id, :amount, :balance_date
  
  attribute :account_name do
    object.account.name
  end
end
