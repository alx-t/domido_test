class Api::V1::WallsController < Api::V1::BaseController

  before_action :load_house, only: [:index, :create, :update]

  def index
    respond_with @house.walls
  end

  def show
    respond_with Wall.find(params[:id]), serializer: WallSerializer::Wall
  end

  def create
    wall = @house.walls.create(
      wall_code: wall_params[:wall_code],
      coordinate: Coordinate.create(wall_params[:coordinate])
    )
    respond_with wall, location: [:api_v1, @house, wall]
  end

  def update
  end

  private

  def load_house
    @house = House.find params[:house_id]
  end

  def wall_params
    params.require(:wall).permit(:wall_code, coordinate: [:start, :end]).to_h
  end
end
