class Clinic < ActiveRecord::Base
  has_many :clinic_schedules
  accepts_nested_attributes_for :clinic_schedules
end