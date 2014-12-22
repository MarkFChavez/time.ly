class SlackWorker 
  include Sidekiq::Worker

  def perform message
    SlackBot.talk message
  end
end
