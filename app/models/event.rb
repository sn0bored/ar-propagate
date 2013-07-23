class Event < ActiveRecord::Base

  validates :date, :title, :organizer_name, presence: true
  #validate :validate_date_format
  validates :title, uniqueness: true
  validate :validate_correct_date

  def validate_correct_date
    if date 
      errors.add(:date, "No time travel!") if date < Date.today
    end
  end

  def validate_date_format
    if date
      date.to_s
      if date.match /\d{8}/ 
        date
      else
        errors.add(:date, "Invalid Date")
      end
    end
  end



end
