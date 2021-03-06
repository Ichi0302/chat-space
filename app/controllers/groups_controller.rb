class GroupsController < ApplicationController
  before_action :set_group, only: [:edit, :update]

  def index
    @groups = current_user.groups
  end

  def new
    @group = Group.new
    @group.users << current_user
  end

  def create
    @group = Group.new
    group = Group.create(group_params)
    if group.save
      redirect_to root_path, flash: {notice: "グループを作成しました。"}
    else
      flash[:alert] = "グループを作成できませんでした。"
      render :new
    end
  end

  def edit
  end

  def update
    if @group.update(group_params)
      redirect_to root_path, flash: {notice: "グループを編集しました。"}
    else
      flash[:alert] = "グループを編集できませんでした。"
      render :edit
    end
  end

  private
  def group_params
    params.require(:group).permit(:name, {user_ids: []})
  end

  def set_group
    @group = Group.find(params[:id])
  end
end
