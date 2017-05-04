class UsersController < ApplicationController
  def search
    name = params[:keyword]
    @users = User.where('name LIKE(?)', "%name%")
    render json: @users
  end
end
