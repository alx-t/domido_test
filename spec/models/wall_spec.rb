require 'rails_helper'

RSpec.describe Wall, type: :model do
  it { should validate_presence_of :house_id }
  it { should belong_to :house }

  it { should validate_presence_of :wall_code }
  it { should validate_length_of(:wall_code).is_at_least(2) }

  it { should have_one(:coordinate).dependent(:destroy) }
end
