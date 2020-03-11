# frozen_string_literal: true

class CashAccount < ApplicationRecord
  ORIGINAL_OWNER = {
    'Client': 'Client',
    'Spouse': 'Spouse',
    'JT Client': 'JT Spouses',
    'RLT Client': 'RLT Client',
    'RLT Spouse': 'RLT Spouse',
    'Other Entity': 'Other Entity'
  }

  NEW_OWNER = {
    'Transfer on Death': 'TOD',
    'Undecided': 'Undecided',
    'Not Funded Per Client': 'NFPC',
    'Not Fundable': 'NF',
    'RLT Client': 'RLT Client',
    'RLT': 'RLT Spouse',
    'Other Entity': 'Other Entity'
  }

  def self.create_collective_pdf_file(investment_accounts, _params)
    pdf = Prawn::Document.new
    pdf.font 'Times-Roman'

    pdf.bounding_box([-75, pdf.cursor + 50], width: 750) do
      pdf.fill_color '556066'
      pdf.fill { pdf.rectangle [0, 0], 700, 90 }
    end

    pdf.move_down 100
    pdf.text '<b>Investment Account Details</b>', size: 16, spacing: 4, inline_format: true, align: :center

    pdf.move_down 45
    investment_account_items = [['Id', 'Date', 'Company Name', 'Original Owner', 'New Account Number']]

    investment_accounts.each do |investment_account|
      investment_account_items << [investment_account.id, investment_account.created_at.strftime('%d-%m-%Y'), investment_account.compnay_name, investment_account.original_owner, investment_account.new_account_number]
    end

    pdf.table(investment_account_items, header: true, position: :center, cell_style: { font: 'Times-Roman', font_style: :italic, overflow: :shrink_to_fit, min_font_size: 8, width: 100, height: 40, border_width: 0, align: :center }) do |table|
      table.row(0).font_style = :bold
      table.row(0).background_color = '235d7d'
      table.row(0).text_color = 'ffffff'
      table.row(0).height = 25
    end

    pdf
  end

  def self.create_pdf_file(investment_account)
    pdf = Prawn::Document.new
    pdf.font 'Times-Roman'

    pdf.bounding_box([-75, pdf.cursor + 50], width: 750) do
      pdf.fill_color '556066'
      pdf.fill { pdf.rectangle [0, 0], 700, 90 }
    end

    pdf.move_down 70
    pdf.text '<b>Invesment Account Details</b>', size: 16, spacing: 4, inline_format: true, align: :center

    pdf.move_down 45
    pdf.text "Investment Account Id# <i>#{investment_account.id}</i>", size: 14, style: :bold, align: :left, inline_format: true
    pdf.text "<b>Date</b>: <i>#{investment_account.created_at.strftime('%d-%m-%Y')}</i>", size: 13, align: :left, inline_format: true
    pdf.text "Investment Account - Company Name: <i>#{investment_account.compnay_name}</i>", size: 14, style: :bold, align: :left, inline_format: true
    pdf.text "Investment Account - Original Owner: <i>#{investment_account.original_owner}</i>", size: 14, style: :bold, align: :left, inline_format: true
    pdf.text "Investment Account - New Account Number# <i>#{investment_account.new_account_number}</i>", size: 14, style: :bold, align: :left, inline_format: true

    pdf.move_down 45
    investment_account_items = [['Id', 'Date', 'Company Name', 'Original Owner', 'New Account Number']]
    investment_account_items << [investment_account.id, investment_account.created_at.strftime('%d-%m-%Y'), investment_account.compnay_name, investment_account.original_owner, investment_account.new_account_number]

    pdf.table(investment_account_items, header: true, position: :center, cell_style: { font: 'Times-Roman', font_style: :italic, overflow: :shrink_to_fit, min_font_size: 8, width: 100, height: 40, border_width: 0, align: :center }) do |table|
      table.row(0).font_style = :bold
      table.row(0).background_color = '235d7d'
      table.row(0).text_color = 'ffffff'
      table.row(0).height = 25
    end

    pdf
  end

  def self.fill_pdf(pdf, cash_account)
    pdf.set_fields(company_name: field_value(cash_account.compnay_name), original_account_number: field_value(cash_account.original_account_number), new_account_number: field_value(cash_account.new_account_number), original_owner: field_value(cash_account.original_owner), new_owner: field_value(cash_account.new_owner))

    pdf.save_as('output/cash_fillable_pdf_output.pdf')
  end

  def self.field_value(cash_account_attribute)
    cash_account_attribute.present? ? cash_account_attribute : '-'
  end
end
