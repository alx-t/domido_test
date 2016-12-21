require 'rails_helper'

describe 'House API' do

  describe 'GET /index' do
    let!(:houses) { create_list :house, 2 }

    before { get '/api/v1/houses', as: :json }

    it 'returns 200 status' do
      expect(response).to be_success
    end

    it 'returns list of houses' do
      expect(response.body).to have_json_size(2).at_path("houses")
    end

    %w(id length width floors floor_height created_at updated_at).each do |attr|
      it "house object contains #{attr}" do
        house = houses.first
        expect(response.body).to be_json_eql(house.send(attr.to_sym).to_json).at_path("houses/0/#{attr}")
      end
    end
  end

  describe 'GET /show' do
    let(:house) { create :house }
    let!(:wall) { create :wall, house: house }

    before { get "/api/v1/houses/#{house.id}", as: :json }

    it 'returns 200 status' do
      expect(response).to be_success
    end

    %w(id length width floors floor_height created_at updated_at).each do |attr|
      it "house object contains #{attr}" do
        expect(response.body).to be_json_eql(house.send(attr.to_sym).to_json).at_path("house/#{attr}")
      end
    end

    context 'walls' do
      it 'included in house object' do
        expect(response.body).to have_json_size(1).at_path('house/walls')
      end

      %w(id house_id wall_code created_at updated_at).each do |attr|
        it "contains #{attr}" do
          expect(response.body).to be_json_eql(wall.send(attr.to_sym).to_json).at_path("house/walls/0/#{attr}")
        end
      end
    end
  end

  describe 'POST /create' do

    context 'with valid attributes' do
      it 'returns create status' do
        post '/api/v1/houses', as: :json, params: { house: attributes_for(:house) }
        p response.status
        p response.body
        expect(response).to be_success
      end

      it 'created new house' do
        expect {
          post '/api/v1/houses', as: :json, params: { house: attributes_for(:house)}
        }.to change(House, :count).by(1)
      end
    end

    context 'with invalid attributes' do
      it 'returns unprocessable_entity status' do
        post '/api/v1/houses', as: :json, params: { house: attributes_for(:invalid_house) }
        expect(response.status).to eql 422
      end

      it 'tries to create a house' do
        expect {
          post '/api/v1/houses', as: :json, params: { house: attributes_for(:invalid_house)}
        }.to_not change(House, :count)
      end
    end
  end

  describe 'PATCH /update' do
  end
end
