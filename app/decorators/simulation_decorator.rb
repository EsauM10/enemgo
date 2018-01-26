class SimulationDecorator < Draper::Decorator
  delegate_all
  decorates_association :exam
  decorates_association :questions

  def time_spent
    Time.at(end_time - start_time).utc.strftime("%Hh%M min")
  end

  def time_left
    Time.at(expires_at - Time.now).utc.strftime("%H:%M:%S")
  end

  def date
    start_time.strftime('%d/%m/%Y')
  end
end
