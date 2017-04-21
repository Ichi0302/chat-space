require 'rails_helper'

describe MessagesController do

  let(:user) { create(:user) }
  let(:group) { create(:group) }
  let(:message) { create(:message, user_id: user.id, group_id: group.id) }
  let(:messages) { create_list(:message, 3)}

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
        expect(message).to be_valid
      end

      it "redirects to message#index" do
        expect(response).to redirect_to group_messages_path
      end

    end

    context "not save invalid attributes" do
      it "message not save" do
        message = build(:message, text: "")
        message.valid?
        expect(message.errors[:text]).to include("を入力してください。")
      end
    end
  end
end