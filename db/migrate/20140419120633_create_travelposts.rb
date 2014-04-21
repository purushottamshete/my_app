class CreateTravelposts < ActiveRecord::Migration
  def change
    create_table :travelposts do |t|
      t.integer :from_city_id
      t.integer :to_city_id
      t.date :travel_date
      t.time :travel_time
      t.integer :seats_available
      t.float :fuel_share
      t.integer :user_id

      t.timestamps
    end
  end
end
