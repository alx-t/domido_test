class Api::V1::HousesController < Api::V1::BaseController

  def index
    respond_with House.all
  end

  def show
    respond_with House
                  .includes(walls: [:coordinate, :elements])
                  .find(params[:id]), serializer: HouseSerializer::House
  end

  def create
    house = House.create house_params
    respond_with house, location: [:api_v1, house]
  end

  def update
  end

  private

  def house_params
    params.require(:house).permit(:length, :width, :floors, :floor_height)
  end
end
