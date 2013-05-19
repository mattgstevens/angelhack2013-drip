class AddDonation < ActiveRecord::Migration
  def change
    create_table :donations do |t|
      t.date :date
      t.timestamps
      t.references :user
      t.references :clinic
    end
  end
end
