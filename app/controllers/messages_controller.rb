class MessagesController < ApplicationController
  def index
    @groups = current_user.groups
    @group = Group.find(params[:group_id])
    @users = @group.users
    @messages = Message.where(group_id: params[:group_id])
    @message = Message.new
  end

  def create
    unless params[:message][:text].present?
      flash[:alert] = "メッセージを入力してください。"
    end
    @message = Message.create(message_params)
    redirect_to group_messages_path
  end

  private
  def message_params
    params.require(:message).permit(:text).merge(group_id: params[:group_id], user_id: current_user.id)
  end
end