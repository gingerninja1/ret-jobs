class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.text :review
      t.references :profile, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
