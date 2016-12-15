require 'rails_helper'

RSpec.describe Coordinate, type: :model do

  it { should validate_presence_of :start }
  it { should validate_presence_of :end }

  it { belong_to :coordinatable }
end
