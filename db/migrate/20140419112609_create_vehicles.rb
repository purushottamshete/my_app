class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.integer :vmodel_id
      t.string :registration_no
      t.string :color

      t.timestamps
    end
  end
end
