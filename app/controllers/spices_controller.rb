class SpicesController < ApplicationController

wrap_parameters format: []


    def index
        render json: Spice.all
    end

    def create
        new_spice = Spice.create!(spice_params)
        render json: new_spice, status: :created
    end

    def update
        updated_spice = Spice.find_by(id: params[:id]).update(spice_params)
        render json: updated_spice, status: :accepted
    end

    def destroy
        Spice.find_by(id: params[:id]).destroy
        head :no_content
    end

    private
    
    def spice_params
        params.permit(:title, :image, :description, :notes, :rating)
    end

end
