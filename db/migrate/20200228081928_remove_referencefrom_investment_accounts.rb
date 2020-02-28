# frozen_string_literal: true

class RemoveReferencefromInvestmentAccounts < ActiveRecord::Migration[6.0]
  def change
    remove_reference :investment_accounts, :user, index: true
  end
end
