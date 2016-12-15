class Wall < ApplicationRecord

  include Coordinatable

  belongs_to :house

  validates :house_id, presence: true
  validates :wall_code, presence: true, length: { minimum: 2 }
end
