class LocationsController < ApplicationController

  def index
    @api_key = ENV.fetch('LOCATION_TRACKER_GOOGLE_API_KEY')
    @location_payloads = User.find(user_id)
      .location_payloads.select(:latitude, :longitude, :address).order(id: :asc)
  end

  private

  def user_id
    params.require(:user_id)
  end
end
