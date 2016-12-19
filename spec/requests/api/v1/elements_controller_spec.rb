require 'rails_helper'

describe 'Element API' do
  let(:house) { create :house }
  let(:coordinate) { create :wall_coord_1 }
  let(:wall) { create :wall, house: house, coordinate: coordinate }

  describe 'GET /index' do
    let!(:elements) { create_list :element, 2, wall: wall }

    before { get "/api/v1/houses/#{house.id}/walls/#{wall.id}/elements", as: :json }

    it 'returns 200 status' do
      expect(response).to be_success
    end

    it 'returns list of elements' do
      expect(response.body).to have_json_size(2).at_path('elements')
    end

    %w(id wall_id element_type created_at updated_at).each do |attr|
      it "element object contains #{attr}" do
        element = elements.first
        expect(response.body).to be_json_eql(element.send(attr.to_sym).to_json).at_path("elements/0/#{attr}")
      end
    end
  end

  describe 'GET /show' do
    let(:coordinate) { create :element_coord_1 }
    let(:element) { create :element, wall: wall, coordinate: coordinate }

    before { get "/api/v1/houses/#{house.id}/walls/#{wall.id}/elements/#{element.id}", as: :json }

    it 'returns 200 status' do
      expect(response).to be_success
    end

    %w(id wall_id element_type created_at updated_at).each do |attr|
      it "element object contains #{attr}" do
        expect(response.body).to be_json_eql(element.send(attr.to_sym).to_json).at_path("element/#{attr}")
      end
    end

    #TODO contains coordinates
  end

  describe 'POST /create' do

    context 'with valid attributes' do
      it 'returns create status' do
        post "/api/v1/houses/#{house.id}/walls/#{wall.id}/elements", as: :json, params: {
          element: attributes_for(:element).merge(coordinate: attributes_for(:element_coord_1))
        }
        expect(response).to be_success
      end

      it 'created a new element' do
        expect {
          post "/api/v1/houses/#{house.id}/walls/#{wall.id}/elements", as: :json, params: {
            element: attributes_for(:element).merge(coordinate: attributes_for(:element_coord_1))
          }
        }.to change(Element, :count).by(1)
      end
    end

    context 'with invalid attributes' do
      it 'returns unprocessable_entity status' do
        post "/api/v1/houses/#{house.id}/walls/#{wall.id}/elements", as: :json, params: {
          element: attributes_for(:invalid_element)
        }
        expect(response.status).to eql 422
      end

      it 'tries to create element' do
        expect {
          post "/api/v1/houses/#{house.id}/walls/#{wall.id}/elements", as: :json, params: {
            element: attributes_for(:invalid_element)
          }
        }.to_not change(Element, :count)
      end
    end
  end

  describe 'PATCH /update'
  describe 'DELETE /delete'
end
