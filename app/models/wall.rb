class Wall < ApplicationRecord

  include Coordinatable

  belongs_to :house
  has_many :elements, dependent: :destroy
  has_many :blocks, dependent: :destroy

  validates :house_id, presence: true
  validates :wall_code, presence: true, length: { minimum: 2 }
end
