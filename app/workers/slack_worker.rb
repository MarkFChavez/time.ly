class SlackWorker 
  include Sidekiq::Worker
  include Sidetiq::Schedulable

  recurrence do
    hourly.minute_of_hour(0, 30) 
  end
  sidekiq_options :retry => false

  def perform
    SlackBot.talk random_reminder.description if random_reminder
  end

  private

  def random_reminder
    Reminder.limit(1).order("RANDOM()").first
  end
end
