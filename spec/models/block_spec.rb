require 'rails_helper'

RSpec.describe Block, type: :model do

  it { should belong_to :block_type }
  it { should validate_presence_of :block_type_id }

  it { should belong_to :wall }
  it { should validate_presence_of :wall_id }

  it { should have_one(:coordinate).dependent(:destroy) }
end
