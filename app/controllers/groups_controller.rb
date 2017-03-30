class GroupsController < ApplicationController
  def index

  end

  def new
    @group = Group.new
    @group.users << current_user
  end


  def create
    group = Group.create(tweet_params)
    if group.save
      flash[:notice] = "グループを作成しました。"
      redirect_to controller: :groups, action: :index
    else
      flash[:alert] = "グループを作成できませんでした。"
      redirect_to controller: :group, action: :new
    end
  end

  def edit
  end

  private
  def tweet_params
    params.require(:group).permit(:name, {user_ids: []})
  end

end
