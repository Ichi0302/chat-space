class GroupsController < ApplicationController
  def index

  end

  def new
    @group = Group.new
  end

  def edit

  end

  def create
    Group.create(tweet_params)
    redirect_to controller: :groups, action: :index
  end

  private
  def tweet_params
    params.require(:group).permit(:name, {user_ids: []})
  end

end
