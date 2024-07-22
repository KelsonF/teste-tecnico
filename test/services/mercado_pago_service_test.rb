# frozen_string_literal: true

require 'test_helper'
require 'mercadopago'

class MercadoPagoServiceTest < ActiveSupport::TestCase
  def setup
    @service = MercadoPagoService.new
  end

  test 'create_card_token should create a card token successfully' do
    user_name = 'John Doe'
    result = @service.create_card_token(user_name)

    assert result.is_a?(Hash), 'Expected result to be a Hash'
    assert_not_nil result['id'], 'Expected card token ID to be present'
    assert_equal user_name, result['cardholder']['name'], 'Expected cardholder name to match'
  end

  test 'payment should process a payment successfully' do
    user_name = 'John Doe'
    user_email = 'john.doe@example.com'
    transaction_amount = 100.0 # Example amount

    result = @service.payment(user_name, user_email, transaction_amount)

    assert result.is_a?(Hash), 'Expected result to be a Hash'
    assert_equal 'approved', result['status'], "Expected payment status to be 'approved'"
  end
end
