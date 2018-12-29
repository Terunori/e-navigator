class RegistrationsController < Devise::RegistrationsController

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

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:update_profile, keys: [:name])
  end

end