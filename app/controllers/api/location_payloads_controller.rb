class Api::LocationPayloadsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create
    lp_params = location_payload_params
    uuid = lp_params.delete :uuid
    email = "#{uuid}@example.com".downcase

    user = User.where(email: email).first
    if user.blank?
      password = SecureRandom.hex
      user = User.create(email: email,
                         password: password,
                         password_confirmation: password)
    end

    user.location_payloads.create! lp_params
    render json: true

    # TODO: error handling
  end

  private

  def location_payload_params
    required_params = %i(uuid latitude longitude timestamp_at speed)
    required_params.each { |p| params.require(p) }
    params.permit required_params
  end
end
