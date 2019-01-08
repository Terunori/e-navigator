class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def mypage
    unless current_user.birthday
      redirect_to edit_profile_path, alert: 'プロフィールを正しく登録してください'
    end
  end

end
