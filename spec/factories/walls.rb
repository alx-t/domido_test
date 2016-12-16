FactoryGirl.define do

  factory :wall do
    house
    wall_code 'V1'
  end

  factory :invalid_wall, class: Wall do
    house
    wall_code nil
  end
end
