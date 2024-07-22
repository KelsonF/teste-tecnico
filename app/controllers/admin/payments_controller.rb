# frozen_string_literal: true

module Admn
  class PaymentsControllers < Admin::BaseController
    def index
      @payments = Payment.all
    end
  end
end
