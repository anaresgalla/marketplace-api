# frozen_string_literal: true

module Api
  module V1
    # Description/Explanation of the class
    class ProductsController < ApplicationController
      respond_to :json

      def show
        respond_with Product.find(params[:id])
      end
    end
  end
end
