class HomeController < ApplicationController
  before_action :check_if_signed_in, only: [:index]

  def index
  end

  private

  def check_if_signed_in
    redirect_to dashboard_path if current_user
  end
end
