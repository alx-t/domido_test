class BlockType < ApplicationRecord
  validates :block_type, presence: true, length: { minimum: 6 }
  validates :length, presence: true,
            numericality: { only_integer: true, greater_than: 0 }
  validates :height, presence: true,
            numericality: { only_integer: true, greater_than: 0 }
  validates :depth, presence: true,
            numericality: { only_integer: true, greater_than: 0 }
  validates :weight, presence: true,
            numericality: { only_integer: true, greater_than: 0 }
end
