require 'rails_helper'

describe MessagesController do

  let(:user) { create(:user) }
  let(:group) { create(:group) }
  let(:message) { build(:message) }

  before do
    sign_in user
    get :index, id: message, group_id: group.id
  end

  describe 'GET#index' do
    it "redirects index view" do
      expect(response).to render_template :index
    end

    it "assigns the requested groups to @groups" do
      groups = user.groups
      expect(assigns(:groups)).to eq groups
    end

    it "assigns the requested gorup to @group" do
      expect(assigns(:group)).to eq group
    end

    it "assigns the requested gorup to @messages" do
      messages = group.messages
      expect(assigns(:messages)).to eq messages
    end
  end

  describe 'Post#create' do
    before do
    post :create, group_id: group.id, message: attributes_for(:message)
    end
    context "save valid attributes" do
      it "message save" do
        expect{
          post :create, group_id: group.id, message: attributes_for(:message)
          }.to change(Message, :count).by(1)
      end
      it "redirects to message#index" do
        post :create, group_id: group.id, message: attributes_for(:message)
        expect(response).to redirect_to group_messages_path
      end
    end
    context "not save invalid attributes" do
      it "message not save" do
        expect{
          post :create, group_id: group.id, message: attributes_for(:message, text: "")
        }.not_to change(Message, :count)
      end
      it "redirects to message#index" do
        post :create, group_id: group.id, message: attributes_for(:message, text: "")
        expect(response).to render_template :index
      end
    end
  end
end