require 'rails_helper'

RSpec.describe Seller::ProductsController, type: :controller do 
  let(:seller_id) { subject.current_seller.id }
  let(:invalid_params) { { product: { name: '', quantity: nil, code: '' } } }
  let(:valid_params) { FactoryBot.attributes_for(:product) }

  describe 'GET #index' do 
    context 'with seller logged in' do 
      login_seller

      let(:product_1) { create(:product, seller_id: seller_id, name: 'first', code: 'firstCODE') }
      let(:product_2) { create(:product, seller_id: seller_id, name: 'second', code: 'secondCODE') }

      before { get :index }

      it do 
        expect(response).to have_http_status(:ok)
        expect(assigns(:products)).to eq([product_1, product_2])
      end
    end

    context 'with user logged in' do
      login_user

      before { get :index }

      it { expect(response).to redirect_to(home_path) }
    end

    context 'with nobody logged in' do
      before { get :index }

      it { expect(response).to redirect_to(login_path) }
    end
  end

  describe 'POST #create' do
    login_seller 

    context 'when the product will be created' do 
      it { expect { post :create, params: { product: valid_params } }.to change(Product, :count) }
    end 

    context 'with valid params' do 
      before { post :create, params: { product: valid_params } }

      it { expect(response).to redirect_to(seller_products_path) }
    end

    context 'when the product will not be created' do 
      it { expect { post :create, params: invalid_params, format: 'js' } .not_to change(Product, :count) }
    end

    context 'with invalid params' do 
      before { post :create, params: invalid_params, format: 'js' }

      it do 
        expect(response).to have_http_status(:ok)
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'PUT #update' do 
    login_seller 

    let(:product) { create(:product, seller_id: seller_id) }
  
    context 'when the product will be updated with all params' do
      before { put :update, params: { id: product, product: { name: 'Updated', quantity: 200, code: 'newCode' } } }

      it do 
        product.reload
        expect(product.name).to eq('Updated')
        expect(product.quantity).to eq(200)
        expect(product.code).to eq('newCode')
        expect(response).to redirect_to(seller_products_path)
      end
    end 

    context 'when the product will not be updated' do 
      before { put :update, params: { id: product, product: { name: '', price: nil } }, format: 'js' }

      it do 
        product.reload
        expect(response).to have_http_status(:ok)
        expect(response).to render_template(:edit)
      end
    end
  end 

  describe 'DELETE #destroy' do
    login_seller

    let!(:product) { create(:product, seller_id: seller_id) }

    context 'when the product will be deleted' do 
      it { expect { delete :destroy, params: { id: product } }.to change(Product, :count).by(-1) }
    end
    
    context 'when the product was delted' do 
      before { delete :destroy, params: { id: product } }

      it { expect(response).to redirect_to(seller_products_path) }
    end
  end
end
