class CreateElements < ActiveRecord::Migration[5.0]
  def change
    create_table :elements, id: :uuid do |t|
      t.references :wall, type: :uuid, foreign_key: true
      t.column :element_type, :element_type

      t.timestamps
    end
  end
end
