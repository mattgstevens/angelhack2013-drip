class AddClinics < ActiveRecord::Migration
  def change
    create_table :clinics do |t|
      t.string :city
      t.string :building
      t.string :building_directions
      t.string :address
      t.float :y_coord
      t.float :x_coord
    end

    create_table :clinic_schedules do |t|
      t.date :date
      t.string :begin_time
      t.string :end_time
      t.references :clinic
    end
  end
end
