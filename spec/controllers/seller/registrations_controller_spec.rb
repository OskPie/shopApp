require 'rails_helper'

RSpec.describe Seller::RegistrationsController, type: :controller do 
  let(:valid_params) { { seller: { firstname: 'first', lastname: 'last', email: 'test@valid.com', password: 'valid' } } }
  let(:invalid_params) { { seller: { firstname: '', lastname: '', email: 'test@invalid', password: '' } } }

  describe 'POST #create' do
    context 'when the seller will be created' do 
      it { expect{ post :create, params: valid_params }
        .to change(Seller, :count).by(1) }
    end

    context 'with valid params' do 
      before { post :create, params: valid_params }

      it { expect(response).to redirect_to(home_path) }
    end 

    context 'when the seller will not be created' do
      it { expect{ post :create, params: invalid_params }
        .not_to change(Seller, :count) }
    end 

    context 'with invalid params' do 
      before { post :create, params: invalid_params } 

      it do 
        expect(response).to have_http_status(:ok)
        expect(response).to render_template(:new)
      end
    end 

    context 'with invalid email' do 
      before { post :create, params: { seller: { email: 'invalid', password: 'valid' } } }

      it do 
        expect(response).to have_http_status(:ok)
        expect(response).to render_template(:new)
      end
    end 

    context 'with invalid password' do 
      before { post :create, params: { seller: { email: 'test@valid.com', password: '' } } }

      it do 
        expect(response).to have_http_status(:ok)
        expect(response).to render_template(:new)
      end
    end
  end
end
