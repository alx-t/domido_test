require 'rails_helper'

RSpec.describe House, type: :model do

  it { should validate_presence_of :length }
  it { should validate_numericality_of(:length).is_greater_than(0).only_integer }

  it { should validate_presence_of :width }
  it { should validate_numericality_of(:width).is_greater_than(0).only_integer }

  it { should validate_presence_of :floors }
  it { should validate_numericality_of(:floors).is_greater_than(0).only_integer }

  it { should validate_presence_of :floor_height }
  it { should validate_numericality_of(:floor_height).is_greater_than(0).only_integer }
end
