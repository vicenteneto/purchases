module Api::V1
  class PurchasesController < ApplicationController
    before_action :set_purchase, only: [:show, :destroy]

    # GET /v1/purchases
    def index
      @purchases = Purchase.all
      json_response(@purchases)
    end

    # GET /v1/purchases/:id
    def show
      json_response(@purchase)
    end

    # DELETE /v1/purchases/:id
    def destroy
      @purchase.destroy
      head :no_content
    end

    private

    def set_purchase
      @purchase = Purchase.find(params[:id])
    end
  end
end
