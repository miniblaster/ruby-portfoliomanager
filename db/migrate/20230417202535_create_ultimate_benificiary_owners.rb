class CreateUltimateBenificiaryOwners < ActiveRecord::Migration[7.0]
  def change
    create_table :ultimate_benificiary_owners do |t|
      t.string :name

      t.timestamps
    end
  end
end
