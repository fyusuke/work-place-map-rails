class CreateContactUsForms < ActiveRecord::Migration[6.0]
  def change
    create_table :contact_us_forms do |t|
      t.string :message
      t.integer :user_id

      t.timestamps
    end
  end
end
