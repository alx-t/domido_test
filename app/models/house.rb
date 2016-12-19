class House < ApplicationRecord
  has_many :walls, dependent: :destroy

  validates :length, presence: true,
            numericality: { only_integer: true, greater_than: 0 }
  validates :width, presence: true,
            numericality: { only_integer: true, greater_than: 0 }
  validates :floors, presence: true,
            numericality: { only_integer: true, greater_than: 0 }
  validates :floor_height, presence: true,
            numericality: { only_integer: true, greater_than: 0 }
end
