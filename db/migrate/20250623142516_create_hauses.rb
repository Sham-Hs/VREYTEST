class CreateHauses < ActiveRecord::Migration[8.0]
  def change
    create_table :hauses do |t|
      t.string :name

      t.timestamps
    end
  end
end
