class ExamDecorator < Draper::Decorator
  delegate_all

  def name
    case kind
      when 'enem' then "Enem #{year}"
      when 'customized' then "Customizado #{year}"
    end
  end

end
