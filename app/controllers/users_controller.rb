class UsersController < ApplicationController
  before_action :authenticate_user!
  # before_action :authenticate_user!, only: [:show]

  def index
    @users = User.all
  end

  def mypage
    unless current_user.birthday
      redirect_to edit_profile_path, notice: 'プロフィールを正しく登録してください'
    end
  end

end
