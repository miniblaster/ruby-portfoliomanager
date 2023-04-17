class CreateExchangeRates < ActiveRecord::Migration[7.0]
  def change
    create_table :exchange_rates do |t|
      t.references :from_currency, null: false
      t.references :to_currency, null: false
      t.decimal :rate

      t.timestamps
    end
    add_foreign_key :exchange_rates, :currencies, column: :from_currency_id
    add_foreign_key :exchange_rates, :currencies, column: :to_currency_id
  end
end
