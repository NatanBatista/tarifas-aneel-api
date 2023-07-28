class LocationsController < ApplicationController
  before_action :set_location, only: [:destroy]
  before_action :authenticate_user!

  def index
    @last_30_locations = current_user.locations.order(created_at: :desc).limit(30)
    render json: @last_30_locations
  end

  # POST /locations
  def create
    @location = Location.new(location_params)
    @location.user_id = current_user.id

    if @location.save
      render json: @location, status: :created, location: @locations_url
    else
      render json: @location.errors, status: :unprocessable_entity
    end
  end

  # DELETE /locations/1
  def destroy
    @location.destroy
  end

  private
    # Only allow a list of trusted parameters through.
    def location_params
      params.require(:location).permit(:city, :region, :country, :latitude, :longitude)
    end
end
