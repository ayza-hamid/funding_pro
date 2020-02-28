# frozen_string_literal: true

class RemoveReferencefromCashAccounts < ActiveRecord::Migration[6.0]
  def change
    remove_reference :cash_accounts, :user, index: true
  end
end
