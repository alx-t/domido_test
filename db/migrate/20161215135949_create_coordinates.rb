class CreateCoordinates < ActiveRecord::Migration[5.0]
  def change
    create_table :coordinates do |t|
      t.references :coordinatable, type: :uuid, polymorphic: true, index: true
      t.jsonb :start
      t.jsonb :end

      t.timestamps
    end
  end
end
