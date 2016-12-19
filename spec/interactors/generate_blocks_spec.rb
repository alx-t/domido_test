require 'rails_helper'

describe GenerateBlocks do
  before do
    @house = FactoryGirl.create :house
    @block_type = FactoryGirl.create :block_type

    @wall = FactoryGirl.create(:wall, coordinate: Coordinate.create(attributes_for(:wall_coord_1)))
    @wall.elements <<
      FactoryGirl.create(:element, coordinate: Coordinate.create(attributes_for(:element_coord_1)))
    @house.walls << @wall

    @house.walls <<
      FactoryGirl.create(:wall, coordinate: Coordinate.create(attributes_for(:wall_coord_2)))
  end

  it '.call should generate blocks' do
    interactor = GenerateBlocks.call(house: @house, block_type: @block_type)
    expect(interactor).to be_a_success
    expect(interactor.house.walls[0].blocks.count).to be > 0
    expect(interactor.house.walls[1].blocks.count).to be > 0
  end

  it '.call does not generate blocks for invalid house' do
    interactor = GenerateBlocks.call(house: nil, block_type: @block_type)
    expect(interactor).to_not be_a_success
  end
end
