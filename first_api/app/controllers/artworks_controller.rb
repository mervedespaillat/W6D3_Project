require 'byebug'

class ArtworksController < ApplicationController
	def index
		# render json: Artwork.all
		# debugger
		render json: Artwork.artworks_for_user_id(params[:user_id])
		#Why does http://localhost:3000/users/2a/artworks work, but 
		# http://localhost:3000/users/22aa/artworks not work?
		# How does it know to truncate just one 'a'?
	end

	def create
			# debugger
			@artwork = Artwork.new(artwork_params)
			if @artwork.save
					redirect_to artwork_url(@artwork)
			else
					render json: @artwork.errors.full_messages, status: :unprocessable_entity
			end
			
	end

	def show
			@artwork = Artwork.find(params[:user_id])
			render json: @artwork
	end

	def update
			@artwork = Artwork.find(params[:id])
			if @artwork.update(artwork_params)
					redirect_to artwork_url(@artwork)
			else
					render json: @artwork.errors.full_messages, status: :unprocessable_entity
			end
	end

	def destroy
			@artwork = Artwork.find(params[:id])
			@artwork.destroy
			# redirect_to artworks_url
			render json: @artwork
	end

	private

	def artwork_params
			params.require(:artwork).permit(:title, :img_url, :artist_id)
	end
end