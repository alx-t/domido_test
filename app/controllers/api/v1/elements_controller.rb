class Api::V1::ElementsController < Api::V1::BaseController

  before_action :load_wall, only: [:index, :create, :update, :delete]

  def index
    respond_with @wall.elements
  end

  def show
    respond_with Element.find(params[:id]), serializer: ElementSerializer::Element
  end

  def create
    element = @wall.elements.create(
      element_type: element_params[:element_type],
      coordinate: Coordinate.create(element_params[:coordinate])
    )
    respond_with element, location: api_v1_house_path(@wall, element)
  end

  def update
  end

  def delete
  end

  private

  def load_wall
    @wall = Wall.find params[:wall_id]
  end

  def element_params
    params.require(:element).permit(:element_type, coordinate: [:start, :end]).to_h
  end
end
