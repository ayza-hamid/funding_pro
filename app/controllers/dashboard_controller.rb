# frozen_string_literal: true

class DashboardController < ApplicationController
  def home
    @investment_accounts = InvestmentAccount.all
    @cash_accounts = CashAccount.all
  end
end
