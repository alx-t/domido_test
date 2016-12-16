FactoryGirl.define do

  factory :wall_coord_1, class: Coordinate do
    start '{x: 0, y: 0}'
    add_attribute(:end) { '{x: 300, y: 0}' }
    association :coordinatable, factory: :wall
  end

  factory :wall_coord_2, class: Coordinate do
    start '{x: 300, y: 0}'
    add_attribute(:end) { '{x: 300, y: 400}' }
    association :coordinatable, factory: :wall
  end
end
