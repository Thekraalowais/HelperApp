class CreateServices < ActiveRecord::Migration[5.2]
  def change
    create_table :services do |t|
      t.string :name
      t.string :location
      t.integer :price
      t.string :contact
      t.boolean :status
      t.string :time

      t.timestamps
    end
  end
end
