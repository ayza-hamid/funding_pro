# frozen_string_literal: true

class User < ApplicationRecord
  MARITAL_STATUSES = {
    Single: 'single',
    Married: 'married',
    Divorced: 'divorced'
  }
end
