class Users::RegistrationsController < Devise::RegistrationsController
  include UsersHelper
  before_action :authenticate_user!

  def edit_profile

  end

  def update_profile
    current_user.assign_attributes(account_update_params)
    if profile_validate
      redirect_to mypage_path, notice: 'プロフィールを更新しました'
    else
      redirect_to edit_profile_path
    end
  end

  # 必要ないのでは
  # protected
  #
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:name, :birthday, :gender, :school])
  # end

end
