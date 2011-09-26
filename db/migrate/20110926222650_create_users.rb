class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :hashed_password
      t.string :salt
      t.datetime :created_date
      t.datetime :last_modified_date

      t.timestamps
    end
  end
end
