# frozen_string_literal: true

class Payment < ApplicationRecord
  validates :user_name, presence: true
  validates :user_email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :transaction_amount, presence: true, numericality: true
end
