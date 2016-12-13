class Block < ApplicationRecord
  belongs_to :block_type
  belongs_to :wall
end
