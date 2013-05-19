class Clinic < ActiveRecord::Base
  has_many :clinic_schedules
  has_many :donations
  accepts_nested_attributes_for :clinic_schedules

  reverse_geocoded_by :x_coord, :y_coord

  def self.city_donation_stats
    city_stats = Hash.new(0)
    cities = Clinic.all.group_by(&:city)
    cities.keys.each do |city|
      cities[city].each do |clinic|
        city_stats[city] += clinic.donations.count * 0.473176473
      end
    end
    city_stats.sort_by{ |k,v| v }.reverse
  end

  def self.clinic_donation_stats
    clinic_stats = Hash.new(0)
    Clinic.all.each do |clinic|
      clinic_stats[clinic.address] = clinic.donations.count * 0.473176473
    end
    clinic_stats.sort_by{ |k,v| v }.reverse
  end

  def currently_open?
    # data for clinics sucks.. need to normalize begin & close times
    if open_clinic = self.clinic_schedules.where(date: Date.today)
      return true
    end
    return false
  end
end