class HouseSerializer < ActiveModel::Serializer
  attributes :id, :length, :width, :floors, :floor_height,
             :created_at, :updated_at

  class House < self
    has_many :walls
  end
end
