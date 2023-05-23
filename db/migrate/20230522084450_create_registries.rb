class CreateRegistries < ActiveRecord::Migration[5.2]
  def change
    create_table :registries do |t|
      t.string :name, null: false 
      t.string :location, null: false 
      t.string :status, :default => 'Open'

      t.timestamps
    end

    add_index :registries, [:name, :location], :unique => true
  end
end
