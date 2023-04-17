class CreateAccountsUltimateBenificiaryOwners < ActiveRecord::Migration[7.0]
  def change
    create_join_table :accounts, :ultimate_benificiary_owners
  end
end
