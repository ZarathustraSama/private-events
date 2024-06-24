class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_many :event_attendees, foreign_key: :attended_event_id
  has_many :attendees, through: :event_attendees, source: :event_attendee

  validates :name, presence: true
  validates :date, presence: true

  scope :past, -> { where("date < ?", Time.now.to_date) }
  scope :upcoming, -> { where("date > ?", Time.now.to_date) }
end
