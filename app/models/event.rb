class Event < ApplicationRecord

	has_many :attendances
  has_many :users, through: :attendances

  #validate :duration_modulo_5
	#validate :start_date_cannot_be_in_the_past

  #validates :start_date, presence: true 
  #validates :duration, presence: true
  #validates :description, presence: true, length: { in: 20..1000, message: "20 char. min & 1000 char. max"} 
  #validates :title, presence: true, length: { in: 5..140, message: "5 char. min & 140 char. max"} 
  #validates :price, presence: true, numericality: { in: 1..1000, }
  #validates :location, presence: true

end

private

def start_date_cannot_be_in_the_past
  if start_date < Time.now
    errors.add(:start_date, 'The start_date can not in the past !')
  end
end

def duration_modulo_5
  if !(duration % 5 == 0 && duration >= 5)
    errors.add(:duration, 'Must be a multiple of 5')
  end
end
