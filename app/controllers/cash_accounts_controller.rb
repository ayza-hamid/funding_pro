# frozen_string_literal: true

class CashAccountsController < ApplicationController
  before_action :cash_account, only: %i[show edit update destroy generate_pdf generate_docx generate_fillable_pdf]

  def index
    @cash_accounts = CashAccount.all
  end

  def new
    @cash_account = CashAccount.new
  end

  def create
    @cash_account = CashAccount.new(cash_account_params)

    if @cash_account.save
      redirect_to root_path
    end
  end

  def show
  end

  def update
    if @cash_account.update(cash_account_params)
      redirect_to root_path, notice: 'cash_account is successfully updated.'
    else
      render :edit, alert: 'Sorry! cash_account is not created'
    end
  end

  def destroy
    if @cash_account.destroy
      respond_to do |format|
        format.js { render :destroy }
      end
    end
  end

  def generate_pdf
    render pdf: "Cash_Account_#{@cash_account.id}", template: 'cash_accounts/cash_account', layout: 'application'
  end

  def generate_docx
    render docx: 'cash_accounts/cash_account', filename: "Cash_Account_#{@cash_account.id}"
  end

  def generate_fillable_pdf
    pdf = FillablePDF.new 'lib/templates/cash_fillable_pdf.pdf'
    CashAccount.fill_pdf(pdf, @cash_account)

    send_file(('output/cash_fillable_pdf_output.pdf'), type: "application/pdf")
  end

  private

  def cash_account
    @cash_account = CashAccount.find(params[:id])
  end

  def cash_account_params
    params.require(:cash_account).permit(:compnay_name, :original_account_number, :new_account_number, :original_owner, :new_owner)
  end
end
