module Api::V1
  class PurchasesController < ApplicationController
    before_action :set_purchase, only: [:show, :destroy]

    # GET /v1/purchases
    def index
      if params.key? :description
        @purchases = Purchase.where('description LIKE ?', "%#{params[:description]}%").all
      else
        @purchases = Purchase.all
      end
      json_response(@purchases)
    end

    # POST /v1/purchases
    def create
      purchase_data = purchase_params
      purchase_data[:client] = Client.find(params[:client])
      purchase_data[:total] = 0
      purchase_data[:purchase_details] = []

      params[:purchase_details].each do |pd|
        purchase_detail = PurchaseDetail.new product: Product.find(pd[:product]), quantity: pd[:quantity]

        if purchase_detail.product.nil?
          return json_response({message: "Couldn't find Product with 'id'=#{pd[:product]}"}, :not_found)
        end

        purchase_data[:total] += purchase_detail.product.price * purchase_detail.quantity
        purchase_data[:purchase_details] << purchase_detail
      end

      @purchase = Purchase.create!(purchase_data)
      json_response(@purchase, :created)
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

    def purchase_params
      # whitelist params
      [:client, :description, :purchase_details].each_with_object(params) do |key, obj|
        obj.require key
      end

      params[:purchase_details].each do |pd|
        [:product, :quantity].each_with_object(pd) do |key, obj|
          obj.require key
        end
      end

      params.permit(:client, :description, :purchase_details)
    end

    def set_purchase
      @purchase = Purchase.find(params[:id])
    end
  end
end
