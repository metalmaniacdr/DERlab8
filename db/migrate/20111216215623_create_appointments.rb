class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.integer :year
      t.string :make
      t.string :model
      t.integer :mileage
      t.string :date
      t.string :time
      t.integer :user_id

      t.timestamps
    end
  end
end
