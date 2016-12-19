FactoryGirl.define do

  factory :element do
    wall
    element_type "window"
  end

  factory :invalid_element, class: Element do
    wall
    element_type nil
  end
end
