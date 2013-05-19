class ClinicController < ApplicationController

  def info
    @clinic_stats = Clinic.clinic_donation_stats
    @city_stats = Clinic.city_donation_stats
    @country_stats = []
  end

  def city_stats
    @current_stats = Clinic.city_donation_stats
    render json: @current_stats.to_json
  end

  def clinic_stats
    @current_stats = Clinic.clinic_donation_stats
    render json: @current_stats.to_json
  end

end
