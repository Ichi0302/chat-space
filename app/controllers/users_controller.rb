class UsersController < ApplicationController

  def index
  end

  def search
    name = params[:keyword]
    @users = User.where('name LIKE(?)', "%#{name}%")
    respond_to do |format|
      format.json{
        render json: @users
      }
    end
  end
end
