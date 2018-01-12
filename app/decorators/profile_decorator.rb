class ProfileDecorator < Draper::Decorator
  delegate_all
  decorates_association :user

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
  
  private
    def empty_fields?(fields)
      return true unless fields.any?
      fields.include? ""
    end
end
