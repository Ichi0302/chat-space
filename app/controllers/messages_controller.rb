class MessagesController < ApplicationController
  before_action :set_view_content, only: [:index, :create]

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

  def set_view_content
    @groups = current_user.groups
    @group = Group.find(params[:group_id])
    @users = @group.users
    @messages = @group.messages
  end
end