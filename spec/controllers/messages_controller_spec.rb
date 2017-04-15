require 'rails_helper'

describe MessagesController do

  before do
    log_in user
    get :index, id: message, group_id: group.id
  end

  describe 'GET#index' do
    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end

  #   it "assigns the requested groups to @groups" do
  #     groups = create(:group)
  #     get :index
  #     expect(assigns(:groups)).to eq groups
  #   end

  #   it "assigns the requested gorup to @group" do
  #     group = create(:group)
  #     get :index
  #     expect(assigns(:group)).to eq group
  #   end

  #   it "assigns the requested gorup to @messages" do
  #     messages = create(:message)
  #     get :index
  #     expect(assigns(:messages)).to eq messages
  #   end

  #   it "assigns the requested gorup to @message" do
  #     message = create(:message)
  #     get :index
  #     expect(assigns(:messages)).to eq message
  #   end
  end

  # describe 'POST#create' do
  #   it "renders the :create template" do
  #     get :create
  #     expect(response).to render_template :create
  #   end

  #   it "assigns the requested gorup to @message" do
  #     message = create(:message)
  #     post :create
  #     expect(assigns(:message)).to eq messages
  #   end
  # end

end