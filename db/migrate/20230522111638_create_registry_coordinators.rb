class CreateRegistryCoordinators < ActiveRecord::Migration[5.2]
  def change
    create_table :registry_coordinators do |t|
      t.integer :registry_id, null: false
      t.string :coordinator_id, null: false

      t.timestamps
    end
  end
end
