require 'csv'

class FetchClinics

  def self.clinics_file
    'tmp/clinics.csv'
  end

  def self.load
    CSV.read(clinics_file).each do |row|
      if row.count == 15
        clinic_data = with_building_description(row)
      else
        clinic_data = without_building_description(row)
      end
      clean_data = prep_data(clinic_data)
      if clinic_check = Clinic.where(city: clean_data[:city], address: clean_data[:address]).first
        schedule = ClinicSchedule.new(clean_data[:clinic_schedules_attributes][0])
        schedule.clinic = clinic_check
        schedule.save
      else
        Clinic.create(clean_data)
      end
    end
  end

  def self.prep_data(data)
    clean_data = data.delete_if { |k| !k.is_a?(Symbol) }
    schedule = {}
    clean_data = data.delete_if { |k,v|
      if k.to_s.include? 'clinic_schedules'
        nfa = k.to_s.split('__')
        schedule[nfa[1].to_sym] = v
      end
      }
      clean_data[:clinic_schedules_attributes] = [schedule]
      clean_data[:x_coord] = clean_data[:x_coord].to_i
      clean_data[:y_coord] = clean_data[:y_coord].to_i
      clean_data
  end

  def self.with_building_description(row)
    attributes = [:clinic_schedules_attribute__date, :city, :building, :building_directions, :address, 'city_again', :clinic_schedules_attribute__begin_time, :clinic_schedules_attribute__end_time, 'one', 'another_number', :y_coord, :x_coord, 'yet_another_number', 'long_string']
    Hash[attributes.zip(row)]
  end

  def self.without_building_description(row)
    attributes = [:date, :city, :building, :address, 'city_again', :begin_time, :end_time, 'one', 'another_number', :y_coord, :x_coord, 'yet_another_number', 'long_string']
    Hash[attributes.zip(row)]
  end

end