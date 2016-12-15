require 'rails_helper'

RSpec.describe Element, type: :model do

  it { should validate_presence_of :wall_id }
  it { should validate_presence_of :element_type }

  it { should have_one(:coordinate).dependent(:destroy) }
end
