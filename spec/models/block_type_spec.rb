require 'rails_helper'

RSpec.describe BlockType, type: :model do

  it { should validate_presence_of :block_type }
  it { should validate_length_of(:block_type).is_at_least(6) }

  it { should validate_presence_of :length }
  it { should validate_numericality_of(:length).is_greater_than(0).only_integer }

  it { should validate_presence_of :height }
  it { should validate_numericality_of(:height).is_greater_than(0).only_integer }

  it { should validate_presence_of :depth }
  it { should validate_numericality_of(:depth).is_greater_than(0).only_integer }

  it { should validate_presence_of :weight }
  it { should validate_numericality_of(:weight).is_greater_than(0).only_integer }
end
