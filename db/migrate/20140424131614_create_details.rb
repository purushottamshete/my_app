class CreateDetails < ActiveRecord::Migration
  def change
    create_table :details do |t|
      t.integer :user_id
      t.string :corp_email
      t.string :mobile
      t.boolean :have_a_car
      t.integer :city_id

      t.timestamps
    end
  end
end
