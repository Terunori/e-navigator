class UsersController < ApplicationController
  include UsersHelper
  before_action :correct_user, only: [ :show, :edit, :update ]

  def index
    @users = User.where.not(id: current_user.id).order(id: :asc)
    @interviews = Interview.where(interviewer_id: current_user.id, allowed: 'allowed').order(begin_at: :asc)
  end

  def show
    redirect_to edit_user_path unless profile_validate
  end

  def edit

  end

  def update
    current_user.assign_attributes(update_user_params)
    if profile_validate && current_user.save
      redirect_to user_path, notice: 'プロフィールを更新しました'
    else
      redirect_to edit_user_path
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def correct_user
    set_user
    redirect_to user_path(current_user.id) if current_user != @user
  end

  def update_user_params
    params.require(:user).permit(:email, :name, :birthday, :gender, :school)
  end

end
