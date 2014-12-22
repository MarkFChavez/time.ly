class MessagesController < ApplicationController
  before_action :check_if_signed_in

  def create
    slack_via_async reminder.description
    redirect_to dashboard_path
  end

  private

  def slack_via_async message
    SlackWorker.perform_async message
  end

  def reminder
    Reminder.find_by id: params[:id]
  end
end
