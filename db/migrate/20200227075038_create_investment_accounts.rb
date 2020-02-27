class CreateInvestmentAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :investment_accounts do |t|
      t.string :compnay_name
      t.string :original_account_number
      t.string :new_account_number
      t.string :original_owner
      t.string :new_owner

      t.timestamps
    end
  end
end
