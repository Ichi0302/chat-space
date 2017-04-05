class MessagesController < ApplicationController
  def index
    @groups = current_user.groups
    @group = Group.find(params[:group_id])
    @users = @group.users
    @messages = @group.messages
    @message = Message.new
  end

  def create
    @message = Message.create(message_params)
    flash[:alert] = "メッセージを入力してください。" unless @message.save
    redirect_to group_messages_path
  end

  private
  def message_params
    params.require(:message).permit(:text).merge(group_id: params[:group_id], user_id: current_user.id)
  end
end