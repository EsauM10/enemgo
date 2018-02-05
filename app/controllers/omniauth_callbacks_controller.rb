class OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    auth = request.env['omniauth.auth']
    @user = User.from_omniauth(auth)

    if @user.persisted?
      # profile = @user.profile
      #
      # profile.update(
      #   first_name: auth.info.name
      # )
      # profile.save(validate: false)
      #
      # puts @user.profile.inspect
      set_flash_message(:notice, :success, kind: 'Facebook') if is_navigational_format?
      sign_in_and_redirect @user, event: :authentication
    else
      session['devise.facebook_data'] = request.env['omniauth.auth']
      redirect_to new_user_registration_url
    end
  end

  def failure
    redirect_to root_path
  end

  def google_oauth2
      @user = User.from_omniauth(request.env['omniauth.auth'])

      if @user.persisted?
        flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: 'Google'
        sign_in_and_redirect @user, event: :authentication
      else
        session['devise.google_data'] = request.env['omniauth.auth'].except(:extra)
        redirect_to new_user_registration_url, alert: @user.errors.full_messages.join("\n")
      end
  end

end
