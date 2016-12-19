class Api::V1::BlocksController < Api::V1::BaseController

  before_action :load_house, only: [:create]

  def create
    block_type = BlockType.find params[:block_type][:id]
    result = GenerateBlocks.call(house: @house, block_type: block_type)
    if result.success?
      render json: result.house, status: 201
    else
      render json: { errors: 'error generating blocks' }, status: 500
    end
  end

  private

  def load_house
    @house = House.find params[:house_id]
  end
end
