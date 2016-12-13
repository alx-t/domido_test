class AddTypes < ActiveRecord::Migration[5.0]
  def change
    enable_extension 'uuid-ossp' unless extension_enabled?('uuid-ossp')

    reversible do |typ|
      typ.up do
        execute <<-SQL
          CREATE TYPE element_type AS ENUM ('window', 'door');
        SQL
      end

      typ.down do
        execute <<-SQL
          DROP TYPE IF EXISTS element_type CASCADE;
        SQL
      end
    end
  end
end
