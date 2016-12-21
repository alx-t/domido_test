class HouseSerializer < ActiveModel::Serializer
  attributes :id, :length, :width, :floors, :floor_height,
             :created_at, :updated_at

  class House < self
    has_many :walls

    def walls
      object.walls.map {
        |wall| WallSerializer::HouseWall.new(wall).as_json
      }
    end
  end
end
