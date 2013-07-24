class Event < ActiveRecord::Base

  validates :title, :organizer_name, :organizer_email, presence: true
  validates :title, uniqueness: true
  validates_format_of :organizer_email, :with => /^([^\s]+)((?:[-a-z0-9]\.)[a-z]{2,})$/i
  validate :validate_correct_date
  validates_format_of :date, :with => /\d{4}.\d{2}.\d{2}/

  def validate_correct_date
    if date 
      errors.add(:date, "No time travel!") if date < Date.today
    end
  end


end
