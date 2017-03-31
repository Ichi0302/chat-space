class GroupsController < ApplicationController
  before_action :create_group, only: [:new, :create]
  before_action :set_group, only: [:edit, :update]

  def create_group
    @group = Group.new
  end

  def set_group
    @group = Group.find(params[:id])
  end

  def index
    @groups = Group.order('id ASC')
  end

  def new
    @group.users << current_user
  end

  def create
    if Group.create(group_params)
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

end
