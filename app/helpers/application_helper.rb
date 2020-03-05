# frozen_string_literal: true

module ApplicationHelper
  def fetch_name(asset_attribute)
    asset_attribute.present? ? asset_attribute : 'Unanswered'
  end

  def fetch_color(asset_attribute)
    asset_attribute.present? ? 'color-black' : 'color-red'
  end

  def fetch_highlight_color(asset_attribute)
    asset_attribute.present? ? 'none' : 'red'
  end
end
