class DashboardsController < ApplicationController
  before_action :check_if_signed_in
  layout "authenticated"

  def show
    @reminders = reminders
  end

  private

  def reminders
    current_user.reminders.newest
  end
end
