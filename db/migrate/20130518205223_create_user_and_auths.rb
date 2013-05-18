class CreateUserAndAuths < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :blood_type
      t.string :city
      t.string :province
      t.timestamps
    end
    create_table :auths do |t|
      t.string :provider
      t.string :uid
      t.string :token
      t.string :secret
      t.timestamps
    end
    create_table :user_auths do |t|
      t.references :user
      t.references :auth
      t.timestamps
    end
  end
end
