class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    @user = User.find_or_create_from_auth_hash!(request.env['omniauth.auth'])

    if @user.persisted?
      sign_in @user
      redirect_to diaries_path, notice: I18n.t('devise.omniauth_callbacks.success', kind: 'Google')
    else
      session['devise.google_data'] = request.env['omniauth.auth'].except('extra')
      redirect_to root_path, alert: @user.errors.full_messages.join("\n")
    end
  end
end
