class MessagesController < ApplicationController
  before_action :check_if_signed_in

  def create
    SlackBot.talk reminder.description
    redirect_to dashboard_path
  end

  private

  def reminder
    Reminder.find_by id: params[:id]
  end
end
