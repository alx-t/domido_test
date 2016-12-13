class CreateBlocks < ActiveRecord::Migration[5.0]
  def change
    create_table :blocks do |t|
      t.references :block_type, foreign_key: true
      t.references :wall, type: :uuid, foreign_key: true
      t.jsonb :coordinates

      t.timestamps
    end
  end
end
