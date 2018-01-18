class UserDecorator < Draper::Decorator
  delegate_all
  decorates_association :profile

  def initial_email
    email.first.upcase
  end

  def module_kind
    return kind if kind == 'student'
    'admin'
  end

end
