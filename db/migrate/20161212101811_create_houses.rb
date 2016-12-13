class CreateHouses < ActiveRecord::Migration[5.0]
  def change
    create_table :houses, id: :uuid do |t|
      t.integer :length
      t.integer :width
      t.integer :floors
      t.integer :floor_height

      t.timestamps
    end
  end
end
