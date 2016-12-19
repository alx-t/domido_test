FactoryGirl.define do

  factory :wall_coord_1, class: Coordinate do
    start {{x: 0, y: 0}}
    add_attribute(:end) {{x: 300, y: 0}}
    association :coordinatable, factory: :wall
  end

  factory :wall_coord_2, class: Coordinate do
    start {{x: 300, y: 0}}
    add_attribute(:end) {{x: 300, y: 400 }}
    association :coordinatable, factory: :wall
  end

  factory :element_coord_1, class: Coordinate do
    start {{x: 120, y: 100}}
    add_attribute(:end) {{x: 180, y: 200}}
    association :coordinatable, factory: :element
  end
end
