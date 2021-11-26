require 'rails_helper'

RSpec.describe UserController, type: :controller do

  describe 'POST #addnewuser' do
    before do
      post :addnewuser, params: params
    end

    context 'when params are correct' do
     # let(:user) { FactoryBot.create :user }
      let(:params) {[username: "abc@gmail.com" ,password: "123456789"]}

      it 'is expected to create new user successfully' do
        expect(assigns[:user]).to be_instance_of(User)
      end

      it 'is expected to have name assigned to it' do
        expect(assigns[:user].username).to eq('abc@gmail.com')
      end

      it 'is expected to have password assigned to it' do
        expect(assigns[:user].password).to eq('2fc319003c67f1170711c6d956f0fc53')
      end

      #it 'is expected to redirect to users path' do
      #  is_expected.to redirect_to users_path
      #end

      it 'is expected to set flash message' do
        expect(flash[:quicknotice]).to eq("<div class='alert alert-danger'><strong>Warning!</strong> Account already exists.</div>")
      end
    end

    #context 'when params are not correct' do
      #let(:params) {  name: '' , password:''}

      #it 'is expected to render new template' do
        #is_expected.to render_template(:new)
      #end

      #it 'is expected to add errors to name attribute' do
        #expect(assigns[:user].errors[:name]).to eq(['can\'t be blank'])
      #end
    #end
  end
end