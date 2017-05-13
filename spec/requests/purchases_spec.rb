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
end
