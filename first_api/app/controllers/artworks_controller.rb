class ArtworksController < ApplicationController
	def index
		render json: Artwork.all
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
			@artwork = Artwork.find(params[:id])
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