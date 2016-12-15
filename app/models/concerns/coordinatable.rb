module Coordinatable
  extend ActiveSupport::Concern

  included do
    has_one :coordinate, as: :coordinatable, dependent: :destroy
  end
end
