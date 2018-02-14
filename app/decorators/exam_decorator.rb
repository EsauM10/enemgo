class ExamDecorator < Draper::Decorator
  delegate_all

  self.object_class.defined_enums.keys.each do |key_enum|
    field_enum = key_enum.pluralize
    klass = self.object_class.name.underscore

    define_singleton_method "t_#{field_enum}" do
      h.t field_enum, scope: "activerecord.attributes.#{klass}"
    end

    define_method "t_#{key_enum}" do
      h.t(send("#{key_enum}"),
        scope: "activerecord.attributes.#{klass}.#{field_enum}")
    end
  end

  def name
    case kind
      when 'enem' then "Enem #{year}"
      when 'customized' then "Customizado #{year}"
    end
  end

  def created
    created_at.strftime("%d/%m/%Y - %R ")
  end

end
