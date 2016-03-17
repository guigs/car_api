class LocationsController < ApplicationController

  # GET /cars
  def index
    latitude, longitude = *location_param.split(',')
    @locations = Location.closest(longitude, latitude)

    render json: {
      cars: @locations.as_json(
        only: :description, methods: [:latitude, :longitude]
      )
    }
  end

  private

  def location_param
    params.require(:location)
  end

end
