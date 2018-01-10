module ApplicationHelper
  def select_profile_avatar(user, options = {})
    if user.profile && user.profile.avatar?
      image_tag user.profile.avatar, id: options[:id]
    else
      user.initial_full_name
    end
  end
end
