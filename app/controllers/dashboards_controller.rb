class DashboardsController < ApplicationController
  before_action :check_if_signed_in
  layout "authenticated"

  def show
  end

  private

  def check_if_signed_in
    redirect_to root_path unless current_user
  end
end
