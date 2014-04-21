class CreateVModels < ActiveRecord::Migration
  def change
    create_table :v_models do |t|
      t.string :name
      t.float :engine_cc
      t.integer :seat_capacity
      t.string :fuel_type

      t.timestamps
    end
  end
end
