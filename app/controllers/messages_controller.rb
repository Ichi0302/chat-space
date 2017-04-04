class MessagesController < ApplicationController
  def index
    @groups = current_user.groups
    @group = Group.find(params[:group_id])
    @users = @group.users
    @message = Message.new
  end

  def create
    @message = Message.create(message_params)
  end

  private
  def message_params
    params.require(:message).permit(:text).merge(group_id: params[:group_id], user_id: current_user.id)
  end
end