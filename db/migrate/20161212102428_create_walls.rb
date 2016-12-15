class CreateWalls < ActiveRecord::Migration[5.0]
  def change
    create_table :walls, id: :uuid do |t|
      t.references :house, type: :uuid, foreign_key: true
      t.string :wall_code

      t.timestamps
    end
  end
end
