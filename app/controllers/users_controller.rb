class UsersController < ApplicationController
  include UsersHelper

  def index
    @users = User.where.not(id: current_user.id).order(id: :asc)
    @interviews = Interview.where(interviewer_id: current_user.id, allowed: 'allowed').order(begin_at: :asc)
  end

  def mypage
    redirect_to edit_profile_path unless profile_validate
  end

end
