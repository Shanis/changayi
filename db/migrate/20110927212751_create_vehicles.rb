class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.integer :year
      t.string :make
      t.string :model
      t.string :style
      t.integer :mileage
      t.string :state
      t.string :city
      t.float :sale_price
      t.string :photo_URL
      t.string :status
      t.string :short_description
      t.text :details
      t.string :vehicle_type
      t.string :license_plate
      t.string :contact_name
      t.string :contact_phone
      t.string :contact_email
      t.integer :created_by
      t.timestamps
    end
  end
end
