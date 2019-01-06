class RegistrationsController < Devise::RegistrationsController
  before_action :authenticate_user!

  def edit_profile

  end

  def update_profile
    current_user.assign_attributes(account_update_params)
    if current_user.save
      redirect_to mypage_path, notice: 'プロフィールを更新しました'
    else
      render :edit_profile
    end
  end

  def mypage
    unless current_user.birthday
      redirect_to edit_profile_path, notice: 'プロフィールを正しく登録してください'
    end
  end

  protected

  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :birthday, :gender, :school])
  end

end