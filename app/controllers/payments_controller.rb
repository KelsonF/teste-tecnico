# frozen_string_literal: true

class PaymentsController < ApplicationController
  before_action :set_payment, only: [:show]
  def new
    @payment = Payment.new
  end

  def create
    @payment = Payment.new(payment_params)
    service = mercado_pago_service

    if @payment.save
      begin
        service.payment(@payment.user_name, @payment.user_email, @payment.transaction_amount)
        flash[:success] = 'Payment successfully created and processed.'
        redirect_to payment_path(@payment)
      rescue Mercadopago::SDK::Error => e
        flash[:error] = "Failed to process payment: #{e.message}"
        render :new
      end
    else
      flash[:error] = 'Failed to create payment.'
      render :new
    end
  end

  def show; end

  private

  def set_payment
    @payment = Payment.find(params[:id])
  end

  def payment_params
    params.require(:payment).permit(:user_name, :user_email, :transaction_amount)
  end

  def mercado_pago_service
    MercadoPagoService.new
  end
end
