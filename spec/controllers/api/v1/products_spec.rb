# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::ProductsController, type: :controller do
  describe 'GET #show' do
    before(:each) do
      @product = FactoryBot.create(:product)
      get :show, params: { id: @product.id }
    end

    it 'return information about a report on a hash' do
      product_response = json_response
      expect(product_response[:title]).to eq @product.title
    end

    it { should respond_with 200 }
  end

  describe 'GET #index' do
    before(:each) do
      FactoryBot.create_list(:product, 5) # create_list pede o nome (:product) e a quantidade (ex: 5)
      get :index
    end

    it 'return 5 records from database' do
      products_response = json_response
      expect(products_response.count).to eq 5
    end

    it { should respond_with 200 }

  end

  describe 'POST #create' do
    context 'when successfully created' do
      before(:each) do
        user = FactoryBot.create(:user)
        @product_attributes = FactoryBot.attributes_for(:product)
        api_authorization_header user.token
        post :create, params: { user_id: user.id, product: @product_attributes }
      end

      it 'renders json representation for the product record just created' do
        product_response = json_response
        expect(product_response[:title]).to eq @product_attributes[:title]
      end

      it { should respond_with 201 }
    end
    
    context 'when it is not created' do
      before(:each) do
        user = FactoryBot.create(:user)
        @invalid_product_attributes = { title: 'Smart TV', price: 'Twelve dollars' }
        api_authorization_header user.token
        post :create, params: { user_id: user.id, product: @invalid_product_attributes }
      end

      it 'renders json errors' do
        product_response = json_response
        expect(product_response).to have_key(:errors)
      end
      
      it 'renders json errors on why the product could not be created' do
        product_response = json_response
        expect(product_response[:errors][:price]).to include 'is not a number'
      end

      it { should respond_with 422 }
    end
  end

  describe 'PUT/PATCH #update' do
    before(:each) do
      @user = FactoryBot.create(:user)
      @product = FactoryBot.create(:product, user: @user)
      api_authorization_header @user.token
    end
    context 'when successfully updated' do
      before(:each) do
        patch :update, params: { user_id: @user.id, id:@product.id, product: { title: 'Samsung TV' } }
      end

      it 'renders json representation for the updated product' do
        product_response = json_response
        expect(product_response[:title]).to eq 'Samsung TV'
      end

      it { should respond_with 200 }
    end

    context 'when is not updated' do
      before(:each) do
        patch :update, params: { user_id: @user.id, id: @product.id,
                                product: { price: 'two thousand' } }
      end

      it 'renders json errors' do
        product_response = json_response
        expect(product_response).to have_key(:errors)
      end

      it 'renders json errors on why the product could not be created' do
        product_response = json_response
        expect(product_response[:errors][:price]).to include 'is not a number'
      end

      it { should respond_with 422 }
    end
  end

  describe 'DELETE #destroy' do
    before(:each) do
      @user = FactoryBot.create(:user)
      @product = FactoryBot.create(:product, user: @user)
      api_authorization_header @user.token
      delete :destroy, params: { user_id: @user.id, id: @product.id }
    end

    it { should respond_with 204 }
  end
      
end
