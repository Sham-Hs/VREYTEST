class CreateMeasurements < ActiveRecord::Migration[8.0]
  def change
    create_table :measurements do |t|
      t.references :meter, null: false, foreign_key: true
      t.float :value_kwh
      t.datetime :recorded_at

      t.timestamps
    end
  end
end
