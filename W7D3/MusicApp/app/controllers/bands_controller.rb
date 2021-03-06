class BandsController < ApplicationController

    def index
        @bands = Band.all
        render :index
    end

    def new
        render :new
    end

    def create
        @band = Band.new(band_params)

        if @band.save
            render :show
        else
            render :new
        end
    end


    def edit
        @band = Band.find_by(id: params[:id])
        render :edit
    end

    def show
        @band = Band.find_by(id: params[:id])
        render :show
    end

    def update
        @band = Band.find_by(id: params[:id])
        
        if @band.update(band_params)
            redirect_to bands_url
        else
            render :edit
        end

    end

    def destroy
        @band = Band.find_by(id: params[:id])
        @band.destroy
        redirect_to bands_url
    end

    private

    def band_params
        params.require(:band).permit(:name)
    end
end
