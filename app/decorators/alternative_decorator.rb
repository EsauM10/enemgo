class AlternativeDecorator < Draper::Decorator
  delegate_all
  ALPH = ('a'..'e').to_a

  def display_option(index)
    "#{ALPH[index]}) #{statement}"
  end

end
