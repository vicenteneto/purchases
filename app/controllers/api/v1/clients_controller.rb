module Api::V1
  class ClientsController < ApplicationController
    before_action :set_client, only: [:show, :update, :destroy]

    # GET /v1/clients
    def index
      @clients = Client.all
      json_response(@clients)
    end

    # POST /v1/clients
    def create
      @client = Client.create!(client_params)
      json_response(@client, :created)
    end

    # GET /v1/clients/:id
    def show
      json_response(@client)
    end

    # PUT /v1/clients/:id
    def update
      @client.update(client_params)
      head :no_content
    end

    # DELETE /v1/clients/:id
    def destroy
      @client.destroy
      head :no_content
    end

    private

    def client_params
      # whitelist params
      params.permit(:first_name, :last_name, :email)
    end

    def set_client
      @client = Client.find(params[:id])
    end
  end
end
