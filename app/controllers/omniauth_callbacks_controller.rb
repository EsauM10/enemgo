class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  before_action :set_user, only: [:facebook, :google_oauth2]

  def facebook
    auth = request.env['omniauth.auth']
    @user = User.from_omniauth(request.env['omniauth.auth'])

    if @user.persisted?
      @user.profile.attributes = {
        first_name: auth.info.first_name,
        last_name: auth.info.last_name,
        remote_avatar_url: auth.info.image,
        birthday: DateTime.strptime(auth.extra.raw_info.birthday, '%m/%d/%Y'),
        sex: auth.extra.raw_info.gender.first.upcase
      }

      @user.profile.save(validate: false)

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
      auth = request.env['omniauth.auth']

      if @user.persisted?

        @user.profile.attributes = {
          first_name: auth.info.first_name,
          last_name: auth.info.last_name,
          remote_avatar_url: auth.info.image,
          sex: auth.extra.raw_info.gender.first.upcase
        }

        @user.profile.save(validate: false)

        flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: 'Google'
        sign_in_and_redirect @user, event: :authentication
      else
        session['devise.google_data'] = request.env['omniauth.auth'].except(:extra)
        redirect_to new_user_registration_url, alert: @user.errors.full_messages.join("\n")
      end
  end

  private

  def set_user
    @user = User.from_omniauth(request.env['omniauth.auth'])
  end

end
