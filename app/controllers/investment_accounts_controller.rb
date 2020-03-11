# frozen_string_literal: true

class InvestmentAccountsController < ApplicationController
  before_action :set_investment_account, only: %i[show edit update destroy generate_pdf generate_docx generate_fillable_pdf]

  def index
    @investment_accounts = InvestmentAccount.all
  end

  def new
    @investment_account = InvestmentAccount.new
  end

  def create
    @investment_account = InvestmentAccount.new(investment_account_params)

    if @investment_account.save
      redirect_to root_path
    end
  end

  def show
  end

  def update
    if @investment_account.update(investment_account_params)
      redirect_to root_path, notice: 'Investment Account is successfully updated.'
    else
      render :edit, alert: 'Sorry! Investment Account is not created'
    end
  end

  def destroy
    @investment_account.destroy
  end

  def generate_pdf
    render pdf: "Investment_Account_#{@investment_account.id}", template: 'investment_accounts/investment_account', layout: 'application'
  end

  def generate_docx
    render docx: 'investment_accounts/investment_account', filename: "Investment_Account_#{@investment_account.id}"
  end

  def generate_fillable_pdf
    pdf = FillablePDF.new 'lib/templates/investment_fillable_pdf.pdf'
    InvestmentAccount.fill_pdf(pdf, @investment_account)
    send_file(('output/investment_fillable_pdf_output.pdf'), type: "application/pdf")
  end

  private

  def set_investment_account
    @investment_account = InvestmentAccount.find(params[:id])
  end

  def investment_account_params
    params.require(:investment_account).permit(:compnay_name, :original_account_number, :new_account_number, :original_owner, :new_owner)
  end
end
