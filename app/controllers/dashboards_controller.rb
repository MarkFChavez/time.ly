class DashboardsController < ApplicationController
  before_action :check_if_signed_in
  layout "authenticated"

  def show
  end

end
