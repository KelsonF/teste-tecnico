class Admin::BaseController < ApplicationController
  before_action :authenticate

  private

  def authorize_admin!
    redirect_to root_path, alert: 'Acesso não autorizado' unless current_user.is_admin?
  end
end