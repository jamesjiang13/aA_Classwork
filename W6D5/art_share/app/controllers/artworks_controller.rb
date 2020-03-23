class ArtworksController < ApplicationController

    # def index
    #     artworks = Artwork.all
    #     render json: artworks
    # end

    def index # to pull by artist_id
        artworks = Artwork.where(artist_id: params[:user_id])
        artworks_shared = ArtworkShare.where(viewer_id: params[:user_id])
        render json: artworks + artworks_shared # look at solution for this later
    end


    def create
        artwork = Artwork.new(artwork_params)
   
        if artwork.save
            redirect_to artwork_url(artwork.id)
        else
            render json: artwork.errors.full_messages, status: 422
        end
            
    end

    def show
        artwork = Artwork.find(params[:id])
        render json: artwork
    end

    def update
        artwork = Artwork.find(params[:id])

        if artwork.update(artwork_params)
            redirect_to "/artworks/#{artwork.id}"
        else
            render json: artwork.errors.full_messages, status: 422

    end

    def destroy
        artwork = Artwork.find(params[:id])
        artwork.destroy   
        render json: artwork
    end

    def edit 
        @artwork = Artwork.find(params[:id])
        render json: artwork
    end

    def new
        artwork = Artwork.new
        render json: artwork
    end

    private
    
    def artwork_params
        params.require(:artwork).permit(:title,:image_url,:artist_id)
    end
end
