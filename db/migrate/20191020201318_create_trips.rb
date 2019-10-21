class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.references :user, foreign_key: true
      t.string :from_location
      t.string :to_location
      t.integer :distance
      t.date :start_date
      t.date :end_date
      t.boolean :visible

      t.timestamps
    end
  end
end
