class CreateAccountsTags < ActiveRecord::Migration[7.0]
  def change
    create_join_table :accounts, :tags
  end
end
