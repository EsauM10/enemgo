class ProfileDecorator < Draper::Decorator
  delegate_all
  decorates_association :user

  AVATAR_BG_COLORS = %w[primary secondary success info warning
    danger pink purple brown cyan yellow gray dark]

  def full_name
    "#{first_name} #{last_name}"
  end

  def initial_full_name
    return user.initial_email if empty_fields? [first_name, last_name]
    "#{first_name.first}#{last_name.first}".upcase
  end

  def birth
    birthday.strftime("%d/%m/%Y")
  end

  def avatar_thumb(options = {})
    return user.initial_email unless profile
    define_avatar options
  end

  def avatar_color
    AVATAR_BG_COLORS[Zlib.crc32("#{user.id}").modulo(AVATAR_BG_COLORS.length)]
  end

  private

    def empty_fields?(fields)
      return true unless fields.any?
      fields.include? ""
    end

    def define_avatar(options)
      size = options[:size] ? "avatar-#{options[:size]}" : ''

      h.content_tag(:div, data: { text: initial_full_name }, 
        class: "avatar bg-#{avatar_color} #{size} #{options[:class]}") do
        if avatar?
          h.image_tag(avatar, id: options[:id])
        else
          h.content_tag(:span, initial_full_name)
        end
      end
    end
end
