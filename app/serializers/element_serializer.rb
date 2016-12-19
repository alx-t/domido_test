class ElementSerializer < ActiveModel::Serializer
  attributes :id, :wall_id, :element_type, :created_at, :updated_at

  class Element < self
    has_one :coordinate
  end
end
