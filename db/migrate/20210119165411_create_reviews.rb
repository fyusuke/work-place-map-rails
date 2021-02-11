class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.integer :place_id
      t.integer :user_id
      t.string :comment
      t.integer :rating

      t.timestamps
    end
    add_index :reviews, [:place_id, :user_id], :unique => true
  end
end
