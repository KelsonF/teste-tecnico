class Admn::PaymentsControllers < Admin::BaseController
  def index
    @payments = Payment.all
  end
end