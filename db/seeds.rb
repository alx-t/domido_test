#

house = House.create length: 600, width: 500, floors: 1, floor_height: 280

v1 = Wall.create house: house, wall_code: 'V1', coordinate:
                 (Coordinate.create start: {x: 0, y: 0}, end: {x: 600, y: 0})
v2 = Wall.create house: house, wall_code: 'V2', coordinate:
                 (Coordinate.create start: {x: 600, y: 0}, end: {x: 600, y: 500})
Element.create wall: v2, element_type: "window", coordinate:
              (Coordinate.create start: {x: 200, y: 150}, end: {x: 300, y: 300})
v3 = Wall.create house: house, wall_code: 'V3', coordinate:
              (Coordinate.create start: {x: 600, y: 500}, end: {x: 0, y: 500})
Element.create wall: v3, element_type: "window", coordinate:
              (Coordinate.create start: {x: 150, y: 150}, end: {x: 250, y: 300})
v4 = Wall.create house: house, wall_code: 'V4', coordinate:
              (Coordinate.create start: {x: 0, y: 500}, end: {x: 0, y: 0})
Element.create wall: v4, element_type: "door", coordinate:
              (Coordinate.create start: {x: 350, y: 10}, end: {x: 450, y: 210})
p1 = Wall.create house: house, wall_code: 'P1', coordinate:
              (Coordinate.create start: {x: 0, y: 250}, end: {x: 300, y: 250})
Element.create wall: p1, element_type: "door", coordinate:
              (Coordinate.create start: {x: 50, y: 10}, end: {x: 100, y: 210})
p2 = Wall.create house: house, wall_code: 'P2', coordinate:
              (Coordinate.create start: {x: 300, y: 250}, end: {x: 300, y: 0})
Element.create wall: p2, element_type: "door", coordinate:
              (Coordinate.create start: {x: 50, y: 10}, end: {x: 150, y: 210})
Wall.create house: house, wall_code: 'P3', coordinate:
              (Coordinate.create start: {x: 150, y: 250}, end: {x: 150, y: 500})

b = BlockType.create block_type: "main block", length: 40,
                     height: 20, depth: 10, weight: 1500

(house.floor_height / b.height).times do |i|
  ((v1.coordinate.end['x'] - v1.coordinate.start['x']) / b.length).times do |j|
    Block.create block_type: b, wall: v1, coordinate:
                 (Coordinate.create start: {x: (j * b.length), y: i * b.height},
                               end: {x: (j * b.length + b.length), y: i * b.height})
  end
end
