class Place < ActiveRecord::Base

	has_many :reviews 

	validates :name, presence: true, length: { minimum: 5 }
	validates :address, presence: true, length: { minimum: 5 }

	# these lines are for the geocoder gem to work
	# what's the field that we want to geocode based on 
	geocoded_by :address
	# when do we want to do it? .. after the top two things have happened, e.g. after we've validated
	after_validation :geocode

end
