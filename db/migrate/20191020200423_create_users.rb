class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :fname
      t.string :lname
      t.string :email
      t.string :profile_image_url
      t.string :bio
      t.integer :friends_count
      t.integer :miles_travelled

      t.timestamps
    end
  end
end
