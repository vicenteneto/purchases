module Api::V1
  class PurchasesController < ApplicationController
    # GET /purchases
    def index
      @purchases = Purchase.all
      json_response(@purchases)
    end
  end
end
