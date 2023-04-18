class AccountSerializer < ActiveModel::Serializer
  attributes :id, :name, :country
  has_many :balances
end
