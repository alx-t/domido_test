FactoryGirl.define do

  factory :house do
    length  100
    width   200
    floors  1
    floor_height  280
  end

  factory :invalid_house, class: House do
    length  nil
    width   nil
    floors  nil
    floor_height  nil
  end
end
