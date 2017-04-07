require 'rails_helper'

describe Message do
  describe '#create' do

    it "is invalid without a text" do
      message = build(:message, text: "")
      message.valid?
      expect(message.error[:text]).to include("を入力してください。")
    end

    it "is valid with a text" do
      message = build(:message)
      expect(message).to be_valid
    end
  end
end
