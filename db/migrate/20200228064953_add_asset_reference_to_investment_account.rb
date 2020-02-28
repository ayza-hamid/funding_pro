# frozen_string_literal: true

class AddAssetReferenceToInvestmentAccount < ActiveRecord::Migration[6.0]
  def change
    add_reference :investment_accounts, :user, index: true
  end
end
