class Block < ApplicationRecord

  include Coordinatable

  belongs_to :block_type
  belongs_to :wall

  validates :block_type_id, :wall_id, presence: true
end
