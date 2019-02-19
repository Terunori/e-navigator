class UsersController < ApplicationController
  include UsersHelper

  def index
    @users = User.all
  end

  def mypage
    redirect_to edit_profile_path unless profile_validate
  end

end
