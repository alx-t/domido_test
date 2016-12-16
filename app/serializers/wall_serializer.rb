class WallSerializer < ActiveModel::Serializer
  attributes :id, :house_id, :wall_code, :created_at, :updated_at
end
