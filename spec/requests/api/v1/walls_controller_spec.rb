require 'rails_helper'

describe 'Wall API' do
  let(:house) { create :house }

  describe 'GET /index' do
    let!(:walls) { create_list :wall, 2, house: house}

    before { get "/api/v1/houses/#{house.id}/walls", as: :json }

    it 'returns 200 status' do
      expect(response).to be_success
    end

    it 'returns list of walls' do
      expect(response.body).to have_json_size(2).at_path('walls')
    end

    %w(id house_id wall_code created_at updated_at).each do |attr|
      it "wall object contains #{attr}" do
        wall = walls.first
        expect(response.body).to be_json_eql(wall.send(attr.to_sym).to_json).at_path("walls/0/#{attr}")
      end
    end
  end

  describe 'GET /show' do
    let(:coordinate) { create :wall_coord_1 }
    let(:wall) { create :wall, house: house, coordinate: coordinate }

    before { get "/api/v1/houses/#{house.id}/walls/#{wall.id}", as: :json }

    it 'returns 200 status' do
      expect(response).to be_success
    end

    %w(id house_id wall_code created_at updated_at).each do |attr|
      it "wall object contains #{attr}" do
        expect(response.body).to be_json_eql(wall.send(attr.to_sym).to_json).at_path("wall/#{attr}")
      end
    end

    #TODO contains elements
    #TODO contains blocks
    #TODO contains coordinates
  end

  describe 'POST /create' do

    context 'with valid attributes' do
      it 'returns create status' do
        post "/api/v1/houses/#{house.id}/walls", as: :json, params: {
          wall: attributes_for(:wall).merge(coordinate: attributes_for(:wall_coord_1))
        }
        expect(response).to be_success
      end

      it 'created a new wall' do
        expect {
          post "/api/v1/houses/#{house.id}/walls", as: :json, params: {
            wall: attributes_for(:wall).merge(coordinate: attributes_for(:wall_coord_1))
          }
        }.to change(house.walls, :count).by(1)
      end
    end

    context 'with invalid attributes' do
      it 'returns unprocessable_entity status' do
        post "/api/v1/houses/#{house.id}/walls", as: :json, params: {
          wall: attributes_for(:invalid_wall)
        }
        expect(response.status).to eql 422
      end

      it 'tries to create wall' do
        expect {
          post "/api/v1/houses/#{house.id}/walls", as: :json, params: {
            wall: attributes_for(:invalid_wall)
          }
        }.to_not change(Wall, :count)
      end
    end
  end

  describe 'PATCH /update'
  describe 'DELETE /delete'
end
