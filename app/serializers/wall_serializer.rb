class WallSerializer < ActiveModel::Serializer
  attributes :id, :house_id, :wall_code, :created_at, :updated_at

  class Wall < self
    has_many :elements
    has_many :blocks
    has_one :coordinate
  end

  class HouseWall < self
    has_many :elements
    has_many :coordinate
  end
end
