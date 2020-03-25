# frozen_string_literal: true

class DashboardController < ApplicationController
  def home
    @investment_accounts = InvestmentAccount.all
    @cash_accounts = CashAccount.all
    @template = Template.first
  end
end
