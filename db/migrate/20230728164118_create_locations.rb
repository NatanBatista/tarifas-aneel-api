class CreateLocations < ActiveRecord::Migration[6.1]
  def change
    create_table :locations do |t|
      t.references :user, null: false, foreign_key: true
      t.string :city, null: false
      t.string :region, null: false
      t.string :country, null: false
      t.string :latitude
      t.string :longitude

      t.timestamps
    end
  end
end
