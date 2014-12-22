class DashboardsController < ApplicationController
  before_action :check_if_signed_in
  layout "authenticated"

  def show
    @reminders = latest_reminders
  end

  private

  def latest_reminders
    current_user.reminders.newest
  end
end
