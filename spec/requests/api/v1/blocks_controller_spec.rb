require 'rails_helper'

describe 'Blocks generate API' do
  let(:house) { create :house }
  let(:coordinate) { create :wall_coord_1 }
  let!(:wall) { create :wall, house: house, coordinate: coordinate }
  let(:block_type) { create :block_type }

  describe 'POST /create' do
    context 'with valid attributes' do
      it 'returns create status' do
        post "/api/v1/houses/#{house.id}/blocks", as: :json, params: {
          block_type: block_type
        }
        expect(response).to be_success
      end

      it 'created a new wall' do
        expect {
          post "/api/v1/houses/#{house.id}/blocks", as: :json, params: {
            block_type: block_type
          }
        }.to change(house.walls[0].blocks, :count).by(98)
      end
    end
  end
end
