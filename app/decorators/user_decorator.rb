class UserDecorator < Draper::Decorator
  delegate_all
  decorates_association :profile

  def initial_email
    email.first.upcase
  end

  def average_time
    time = simulations.collect {|s| (s.end_time - s.start_time)}
    sum = time.reduce(:+)
    average = 0
    average = (sum / time.size) unless sum.nil?
    Time.at(average).utc.strftime("%M min")
  end

  def module_kind
    return kind if kind == 'student'
    'admin'
  end

  def t_kind
    return 'Estudante' if kind == 'student'
    'Administrador'
  end

end
