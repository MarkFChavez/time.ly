class SessionsController < ApplicationController
  def create
    user = User.from_omniauth auth_hash, TokenGenerator.run
    session["user.id"] = user.id

    redirect_to dashboard_path
  end

  def destroy
    session["user.id"] = nil
    redirect_to root_path
  end

  private

  def auth_hash
    request.env["omniauth.auth"]
  end
end
