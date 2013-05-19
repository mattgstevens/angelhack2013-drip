class LeaderboardController < ApplicationController

  def info

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
