require 'rails_helper'

RSpec.describe 'Purchases API', type: :request do
  # initialize test data
  let!(:purchases) {create_list(:purchase, 10)}
  let(:purchase_id) {purchases.first.id}

  # Test suite for GET /v1/purchases
  describe 'GET /v1/purchases' do
    # make HTTP get request before each example
    before {get '/v1/purchases'}

    it 'returns purchases' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /v1/purchases/:id
  describe 'GET /v1/purchases/:id' do
    before {get "/v1/purchases/#{purchase_id}"}

    context 'when the record exists' do
      it 'returns the purchase' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(purchase_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:purchase_id) {100}

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Purchase/)
      end
    end
  end
end
