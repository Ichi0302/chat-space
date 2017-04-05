class MessagesController < ApplicationController
  before_action :set_group, only: [:index, :create]
  before_action :set_message, only: [:index, :create]

  def index
    @message = Message.new
  end

  def create
    @message = current_user.messages.new(message_params)
    if @message.save
      redirect_to group_messages_path
    else
      flash[:alert] = "メッセージを入力してください。"
      render :index
    end
  end

  private
  def message_params
    params.require(:message).permit(:text).merge(group_id: params[:group_id])
  end

  def set_group
    @groups = current_user.groups
    @group = Group.find(params[:group_id])
  end

  def set_message
    @messages = @group.messages
  end
end