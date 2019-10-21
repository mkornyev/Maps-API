class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.references :trip, foreign_key: true
      t.string :tagline
      t.integer :like_count
      t.integer :comments_count
      t.date :date

      t.timestamps
    end
  end
end
