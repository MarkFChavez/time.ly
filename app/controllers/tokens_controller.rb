class TokensController < ApplicationController
  before_action :check_if_signed_in

  def create
    current_user.update!(access_token: TokenGenerator.run)
    redirect_to dashboard_path
  end

  def fetch_token
    render json: { status: :ok, token: current_user.access_token }
  end
end
