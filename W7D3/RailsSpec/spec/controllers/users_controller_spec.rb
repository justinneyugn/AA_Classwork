require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe 'GET #index' do
    it 'renders the users index' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #new' do
    before(:each){create(:user)}
    it 'brings up the form for a new user' do
      allow(subject).to receive(:current_user).and_return(User.last)
      get :new
      expect(response).to render_template(:new)
    end
  end
  
  describe 'POST #create' do
    before(:each) do
      create(:user)
      allow(subject).to receive(:current_user).and_return(User.last)
    end
    let(:valid_params){{user: {username: "Jon", password: "password"}}}
    let(:invalid_params){{user: {username: "", password: "pass"}}}

    context "with valid params" do
      it "redirects to new user's show page" do
        post :create, params: valid_params
        expect(response).to redirect_to(user_url(User.last.id))
      end
      it "creates the user" do
        post :create, params: valid_params
        expect(User.last.username).to eq("Jon")
      end
    end

    context "with invalid params" do
      it "renders to new page" do
        post :create, params: invalid_params
        expect(response).to render_template(:new)
      end
      it "flashes an error" do
        post :create, params: invalid_params
        expect(flash[:errors]).to be_present
      end
    end
  end

end
