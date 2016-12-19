class GenerateBlocks
  include Interactor

  #TODO now floors == 1

  def call
    @house = context.house
    @block_type = context.block_type
    begin
      ActiveRecord::Base.transaction do
        @house.walls.each { |wall| generate_wallblocks(wall) }
      end
      context.house
    rescue
      context.fail!
    end
  end

  private

  def generate_wallblocks(wall)
    clear_blocks wall
    (@house.floor_height / @block_type.height).times do |row_count|
      generate_blockrow wall, row_count
    end
  end

  def clear_blocks(wall)
    wall.blocks.delete_all
  end

  def generate_blockrow(wall, row_count)
    #TODO to wall.length
    length = (wall.coordinate.end['x'] - wall.coordinate.start['x']).abs >0 ?
      (wall.coordinate.end['x'] - wall.coordinate.start['x']).abs :
      (wall.coordinate.end['y'] - wall.coordinate.start['y']).abs
    (length / @block_type.length).times do |block_count|
      generate_blocks wall, row_count, block_count
    end
  end

  #TODO to element.contains?
  def element_contains?(element, coordinate)
    if (coordinate.start['x'] >= element.coordinate.start['x'] &&
      coordinate.end['x'] < element.coordinate.end['x']) &&
      (coordinate.start['y'] >= element.coordinate.start['y'] &&
        coordinate.end['y'] < element.coordinate.end['y'])
      #p "element coord #{coordinate.start} #{coordinate.end}"
      return true
    else
      return false
    end
  end

  def contains?(wall, coordinate)
    wall.elements.each do |element|
      return true if element_contains?(element, coordinate)
    end
    return false
  end

  def generate_blocks(wall, row_count, block_count)
    block_coordinate = Coordinate.new(
      start: {
        x: block_count * @block_type.length,
        y: row_count * @block_type.height
      },
      end: {
        x: block_count * @block_type.length + @block_type.length,
        y: row_count * @block_type.height
      }
    )
    unless contains?(wall, block_coordinate)
      Block.create!(
        block_type: @block_type,
        wall: wall,
        coordinate: block_coordinate
      )
    end
  end
end
