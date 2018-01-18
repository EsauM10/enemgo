class SimulationDecorator < Draper::Decorator
  delegate_all
  decorates_association :exam

  def time_spent
    Time.at(end_time - start_time).utc.strftime("%Hh%M min")
  end

  def date
    start_time.strftime('%d/%m/%Y')
  end
end
