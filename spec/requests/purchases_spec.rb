require 'rails_helper'

RSpec.describe 'Purchases API', type: :request do
  # initialize test data
  let!(:clients) {create_list(:client, 5)}
  let!(:products) {create_list(:product, 5)}
  let!(:purchases) {create_list(:purchase, 10)}
  let(:client_id) {clients.first.id}
  let(:product_id) {products.first.id}
  let(:purchase_id) {purchases.first.id}

  #Valid payload
  let(:request_attributes) {{client: client_id, description: 'Three ZenFone 3', purchase_details: [{product: product_id, quantity: 3}]}}

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

  # Test suite for GET /v1/purchases?description=...
  describe 'GET /v1/purchases?description=...' do
    # make HTTP get request before each example
    before {
      post '/v1/purchases', params: request_attributes
      get '/v1/purchases?description=zenfone'
    }

    it 'returns purchases' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(1)
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
        expect(response.body).to match(/Couldn't find Purchase with 'id'=100/)
      end
    end
  end

  # Test suite for POST /v1/purchases
  describe 'POST /v1/purchases' do
    before {post '/v1/purchases', params: request_attributes}

    context 'when the request is valid' do
      it 'creates a purchase' do
        expect(json['client_id']).to eq(client_id)
        expect(json['description']).to eq('Three ZenFone 3')
        expect(json['purchase_details']).not_to be_empty
        expect(json['purchase_details'].size).to eq(1)
        expect(json['total']).not_to eq(0)
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the client does not exists' do
      let(:request_attributes) {{client: 100, description: 'Three ZenFone 3', purchase_details: [{product: product_id, quantity: 1}]}}

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a validation failure message' do
        expect(response.body)
            .to match(/Couldn't find Client with 'id'=100/)
      end
    end

    context 'when the product does not exists' do
      let(:request_attributes) {{client: client_id, description: 'Description', purchase_details: [{product: 100, quantity: 1}]}}

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a validation failure message' do
        expect(response.body)
            .to match(/Couldn't find Product with 'id'=100/)
      end
    end
  end

  # Test suite for PUT /v1/purchases/:id
  describe 'PUT /v1/purchases/:id' do
    before {put "/v1/purchases/#{purchase_id}", params: request_attributes}

    context 'when the record exists' do
      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end

    context 'when the purchase does not exists' do
      let(:purchase_id) {100}

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a validation failure message' do
        expect(response.body)
            .to match(/Couldn't find Purchase with 'id'=100/)
      end
    end

    context 'when the client does not exists' do
      let(:request_attributes) {{client: 100, description: 'Three ZenFone 3', purchase_details: [{product: product_id, quantity: 1}]}}

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a validation failure message' do
        expect(response.body)
            .to match(/Couldn't find Client with 'id'=100/)
      end
    end

    context 'when the product does not exists' do
      let(:request_attributes) {{client: client_id, description: 'Description', purchase_details: [{product: 100, quantity: 1}]}}

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a validation failure message' do
        expect(response.body)
            .to match(/Couldn't find Product with 'id'=100/)
      end
    end
  end

  # Test suite for DELETE /v1/purchases/:id
  describe 'DELETE /v1/purchases/:id' do
    before {delete "/v1/purchases/#{purchase_id}"}

    context 'when the purchase does not exists' do
      let(:purchase_id) {100}

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a validation failure message' do
        expect(response.body)
            .to match(/Couldn't find Purchase with 'id'=100/)
      end
    end

    context 'when the purchase exists' do
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end
end
