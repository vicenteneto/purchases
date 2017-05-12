require 'rails_helper'

RSpec.describe 'Clients API', type: :request do
  # initialize test data
  let!(:clients) {create_list(:client, 10)}
  let(:client_id) {clients.first.id}

  # Test suite for GET /clients
  describe 'GET /clients' do
    # make HTTP get request before each example
    before {get '/clients'}

    it 'returns clients' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /clients/:id
  describe 'GET /clients/:id' do
    before {get "/clients/#{client_id}"}

    context 'when the record exists' do
      it 'returns the client' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(client_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:client_id) {100}

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Client/)
      end
    end
  end

  # Test suite for POST /clients
  describe 'POST /clients' do
    # valid payload
    let(:valid_attributes) {{first_name: 'John', last_name: 'Lennon', email: 'john.lennon@beatles.com'}}

    context 'when the request is valid' do
      before {post '/clients', params: valid_attributes}

      it 'creates a client' do
        expect(json['first_name']).to eq('John')
        expect(json['last_name']).to eq('Lennon')
        expect(json['email']).to eq('john.lennon@beatles.com')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before {post '/clients', params: {first_name: 'Paul', last_name: 'McCartney'}}

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
            .to match(/Validation failed: Email can't be blank/)
      end
    end
  end

  # Test suite for PUT /clients/:id
  describe 'PUT /clients/:id' do
    let(:valid_attributes) {{first_name: 'Paul'}}

    context 'when the record exists' do
      before {put "/clients/#{client_id}", params: valid_attributes}

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /clients/:id
  describe 'DELETE /clients/:id' do
    before {delete "/clients/#{client_id}"}

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
