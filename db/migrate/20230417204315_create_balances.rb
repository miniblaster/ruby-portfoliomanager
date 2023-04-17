class CreateBalances < ActiveRecord::Migration[7.0]
  def change
    create_table :balances do |t|
      t.decimal :amount
      t.datetime :balance_date
      t.references :account, null: false, foreign_key: true
      t.references :exchange_rate, null: false, foreign_key: true

      t.timestamps
    end
  end
end
