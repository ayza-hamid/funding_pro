# frozen_string_literal: true

class InvestmentAccountsController < ApplicationController
  before_action :set_investment_account, only: %i[show edit update destroy generate_pdf]

  def index
    @investment_accounts = InvestmentAccount.all
  end

  def new
    @investment_account = InvestmentAccount.new
  end

  def create
    @investment_account = InvestmentAccount.new(investment_account_params)

    if @investment_account.save
      redirect_to investment_accounts_path
    end
  end

  def show
  end

  def update
    if @investment_account.update(investment_account_params)
      redirect_to investment_account_path, notice: 'investment_account is successfully updated.'
    else
      render :edit, alert: 'Sorry! investment_account is not created'
    end
  end

  def destroy
    @investment_account.destroy
  end

  def generate_pdf
    pdf = InvestmentAccount.create_pdf_file(@investment_account)
    send_data pdf.render, filename: "InvestmentAccount_#{@investment_account.id}.pdf", type: 'application/pdf'
  end

  def generate_pdf_collection
    @investment_accounts = InvestmentAccount.all

    render pdf: 'report', template: 'assets/asset_report.html.erb'
  end

  private

  def set_investment_account
    @investment_account = InvestmentAccount.find(params[:id])
  end

  def investment_account_params
    params.require(:investment_account).permit(:compnay_name, :original_account_number, :new_account_number, :original_owner, :new_owner)
  end
end
