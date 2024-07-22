# frozen_string_literal: true

class MercadoPagoService
  def initialize
    @access_token = ENV['API_KEY']
    @client_sdk = Mercadopago::SDK.new(@access_token)
  end

  def create_card_token(user_name)
    card_token_object = {
      card_number: '5031433215406351',
      expiration_year: 2025,
      expiration_month: 11,
      security_code: '123',
      cardholder: {
        name: user_name
      }
    }

    begin
      result_card_token = @client_sdk.card_token.create(card_token_object)
      result_card_token[:response]
    rescue Mercadopago::SDK::Error => e
      raise "Failed to create card token: #{e.message}"
    end
  end

  def payment(user_name, user_email, transaction_amount)
    result_card_token = create_card_token(user_name)
    payment_object = {
      token: result_card_token['id'],
      installments: 1,
      transaction_amount:,
      description: 'Descrição aleatória',
      payment_method_id: 'visa',
      payer: {
        email: user_email
      }
    }

    result = @client_sdk.payment.create(payment_object)
    result[:response]
  rescue Mercadopago::SDK::Error => e
    raise "Failed to process payment: #{e.message}"
  end
end
