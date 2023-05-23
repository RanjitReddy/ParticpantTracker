class CreateParticipants < ActiveRecord::Migration[5.2]
  def change
    create_table :participants do |t|
      t.string :name, null: false
      t.string :gender, null: false
      t.date :date_of_birth, null: false
      t.string :email, null: false
      t.string :phone, null: false
      t.string :method_of_contact, null: false

      t.timestamps
    end
  end
end
