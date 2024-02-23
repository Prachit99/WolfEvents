require 'rails_helper'

RSpec.describe RoomsController, type: :controller do
  describe 'GET #index' do


    context 'when the user is not an admin' do
      before do
        allow(controller).to receive(:current_admin).and_return(nil)
        get :index
      end

      it 'redirects to the root path' do
        expect(response).to redirect_to(root_path)
      end

      # it 'sets a flash notice about unauthorized access' do
      #   expect(flash[:notice]).to eq("You are not authorized to see rooms.")
      # end
    end
  end
end