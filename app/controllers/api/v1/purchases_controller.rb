module Api::V1
  class PurchasesController < ApplicationController
    before_action :set_purchase, only: [:show]

    # GET /v1/purchases
    def index
      @purchases = Purchase.all
      json_response(@purchases)
    end

    # GET /v1/purchases/:id
    def show
      json_response(@purchase)
    end

    private

    def set_purchase
      @purchase = Purchase.find(params[:id])
    end
  end
end
