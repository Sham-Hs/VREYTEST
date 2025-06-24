class CreateUnits < ActiveRecord::Migration[8.0]
  def change
    create_table :units do |t|
      t.string :name
      t.references :house, null: false, foreign_key: true

      t.timestamps
    end
  end
end
