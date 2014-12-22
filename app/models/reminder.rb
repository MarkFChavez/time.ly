class Reminder < ActiveRecord::Base
  belongs_to :user
  validates :description, presence: true

  scope :newest, -> { order(created_at: :desc) }
end
