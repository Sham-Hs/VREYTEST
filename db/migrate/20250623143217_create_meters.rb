class CreateMeters < ActiveRecord::Migration[8.0]
  def change
    create_table :meters do |t|
      t.string :type
      t.references :unit, null: false, foreign_key: true
      t.integer :location_id

      t.timestamps
    end
  end
end
