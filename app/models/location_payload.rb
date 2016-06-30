class LocationPayload < ActiveRecord::Base
  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode

  belongs_to :user
end
