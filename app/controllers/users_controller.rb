class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @match_details = @user.get_match_details
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    response = User.update_user(params[:user])
    if response[:error].present?
      flash[:alert] = response[:error]
      redirect_to edit_path(id: params[:user][:id])
    else
      flash[:notice] = response[:notice]
      redirect_to root_path
    end
  end

  def leaderboard
    @users = User.where("total_matches >= 10").order("highest_score desc").limit(10)
  end
end