class UserDecorator < Draper::Decorator
  delegate_all
  decorates_association :profile

  def avatar(options = {})
    return initial_email unless profile
    define_avatar options
  end

  def initial_email
    email.first.upcase
  end

  private

    def define_avatar(options)
      if profile.avatar?
        h.image_tag profile.avatar, id: options[:id]
      else
        profile.initial_full_name
      end
    end

end
