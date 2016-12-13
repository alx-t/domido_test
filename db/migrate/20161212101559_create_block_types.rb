class CreateBlockTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :block_types do |t|
      t.string :block_type
      t.integer :length
      t.integer :height
      t.integer :depth
      t.integer :weight

      t.timestamps
    end
  end
end
