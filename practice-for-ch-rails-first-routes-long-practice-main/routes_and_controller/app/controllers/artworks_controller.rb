class ArtworksController < ApplicationController

    
    def index
      # debugger
        @artworks = Artwork.artworks_for_user_id(params[:user_id])
        render json: @artworks
    end

    def create
        if @artwork = Artwork.create(artwork_params)
          render json: @artwork
        else
            
          render json: @artwork.errors.full_messages, status: :unprocessable_entity
        end
    end

    def show
      # debugger
      @artwork = Artwork.find(params[:id])

      render json: @artwork
    end

    def update
      @artwork = Artwork.find(params[:id])

      if @artwork.update(user_params)
        # redirect_to user_url(@artwork)
        render json:@artwork
      else
        render json:@artwork.errors.full_messages, status: 422
      end
    end

    def destroy
      @artwork = Artwork.find(params[:id])

      if @artwork.destroy
        render json: Artwork.all
      else
        render json:@artwork.errors.full_messages, status: 422
      end
    end

    private

    def artwork_params
      params.require(:artwork).permit(:title, :image_url, :artist_id)
    end
end