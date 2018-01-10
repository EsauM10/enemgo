class ProfileDecorator < Draper::Decorator
  delegate_all

  def full_name
    "#{first_name} #{last_name}"
  end

  def initial_full_name
    "#{first_name.first}#{last_name.first}".upcase
  end

end
