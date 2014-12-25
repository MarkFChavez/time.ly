class Api::V1::RemindersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render json: reminders.to_json(only: [:id, :description])
  end

  def create
    user.reminders.create! reminder_params

    render json: { status: :ok }
  rescue
    render json: { status: :unprocessable_entity }
  end

  private

  def reminders
    user.reminders
  end

  def reminder_params
    params.require(:reminder).permit(:description)
  end

  def user
    User.find_by access_token: access_token
  end

  def description
    params[:description]
  end

  def access_token
    params[:access_token]
  end
end
