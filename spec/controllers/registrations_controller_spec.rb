require 'rails_helper'

RSpec.describe RegistrationsController, type: :controller do 
  let(:valid_params) { { user: { firstname: 'first', lastname: 'last', email: 'test@valid.com', password: 'valid' } } }
  let(:invalid_params) { { user: { firstname: '', lastname: '', email: 'test@invalid', password: '' } } }

  describe 'POST #create' do 
    context 'when the user will be created' do 
      it { expect{ post :create, params: valid_params }
        .to change(User, :count).by(1) }
    end 

    context 'with valid params' do 
      before { post :create, params: valid_params }

      it do 
        expect(response).to have_http_status(:found)
        expect(response).to redirect_to(home_path)
      end
    end 

    context 'when the user will not be created' do 
      it { expect{ post :create, params: invalid_params }
        .not_to change(User, :count) }    
    end

    context 'with invalid params' do 
      before { post :create, params: invalid_params } 

      it { expect(response).to have_http_status(:ok) }
    end 
  end
end
