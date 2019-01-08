module UsersHelper
  def profile_validate
    return false unless param_alert(current_user.email, "メールアドレスを入力してください")
    return false unless param_alert(current_user.name, "名前を入力してください")
    return false unless param_alert(current_user.birthday, "誕生日を入力してください")
    return false unless param_alert(current_user.gender, "性別を入力してください")
    return false unless param_alert(current_user.school, "出身大学・大学院を入力してください")
    return true
  end

  private
  def param_alert(key, message)
    if key == nil || key == ''
      flash[:alert] = message
      return false
    end
    return true
  end
end
