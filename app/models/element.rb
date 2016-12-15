class Element < ApplicationRecord

  include Coordinatable

  belongs_to :wall

  validates :wall_id, :element_type, presence: true
end
