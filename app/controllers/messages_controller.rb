class MessagesController < ApplicationController
  def index
    @groups = current_user.groups
    @group = Group.find(params[:group_id])
    @users = @group.users
    @messages = @group.messages
    @message = Message.new
  end

  def create
    @message = current_user.messages.create(message_params)
    unless @message.save
      redirect_to group_messages_path, flash: {alert: "メッセージを入力してください。"}
    else
      redirect_to group_messages_path
    end
  end

  private
  def message_params
    params.require(:message).permit(:text).merge(group_id: params[:group_id])
  end
end