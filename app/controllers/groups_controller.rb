class GroupsController < ApplicationController
  def index

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
    @group = Group.find(params[:id])
  end

  def update
    group = Group.find(params[:id])
    tweet.update(group_params)
  end

  private
  def group_params
    params.require(:group).permit(:name, {user_ids: []})
  end

end
