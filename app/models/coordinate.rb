class Coordinate < ApplicationRecord
  belongs_to :coordinatable, polymorphic: true

  validates :start, :end, presence: true
end
