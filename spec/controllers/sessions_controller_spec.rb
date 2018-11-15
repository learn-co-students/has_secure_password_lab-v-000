require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  before do
    User.destroy_all
  end

  let(:connie) {User.create(name: 'Connie', password: 'M4heswaran')}

  describe 'post create' do


    it 'rejects invalid passwords' do
      post :create, user: {name: connie.name, password: connie.password + 'x'}
      expect(session[:user_id]).to be_nil
    end

    it 'rejects empty passwords' do
      post :create, user: {name: connie.name, password: ''}
      expect(session[:user_id]).to be_nil
    end
  end
end
