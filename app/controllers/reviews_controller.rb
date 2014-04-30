class ReviewsController < ApplicationController

	def new
		@place = Place.find(params[:place_id])
		@review = @place.reviews.new
	end

	def create
		@place = Place.find(params[:place_id])
		@review = @place.reviews.new(review_params)

		if @review.save

			flash[:success] = "Thanks for reviewing this place"

			# take me back to the homepage after saving
			redirect_to root_path

		else

			render "new"

		end

	end

	def review_params
		params.require(:review).permit(:body, :rating) 
	end

end
