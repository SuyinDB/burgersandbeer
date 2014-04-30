class Review < ActiveRecord::Base

	belongs_to :place

	validates :body, presence: true
	validates :rating, inclusion: { in: 0..5 }

end
