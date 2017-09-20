class Api::V1::UsersController < ApplicationController

  def create
    @user = User.find_or_create_by(spotify_user_id: params[:user_id], name: params[:name])
  end
end
