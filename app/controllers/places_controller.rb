class PlacesController < ApplicationController

	def index

		# to get all places to show
		# @places = Place.all

		# to only get places near London
		# @places = Place.near("London")

		# to get places near the specified search if one has been done
		if params[:search].present?  
			@places = Place.near(params[:search] + ", UK", 100).page(params[:page]).per(3) 
			# addition in text narrows the search to UK, 100 after comma increases search area
			# page bit is limiting results to 3 places per page
		else 
			@places = Place.near("London").page(params[:page]).per(3) 
		end


	end

	def show
		@place = Place.find(params[:id])
	end

	def new

		@place = Place.new

	end

	def create
		@place = Place.new(place_params)

		if @place.save 

			flash[:success] = "Thanks for adding somewhere new"

			redirect_to root_path

		else 

			# show the new view again when save fails because of uniqueness validation
			render "new"

		end	

	end

	def place_params

		params.require(:place).permit(:name, :address, :longitude, :latitude) 

	end

end
