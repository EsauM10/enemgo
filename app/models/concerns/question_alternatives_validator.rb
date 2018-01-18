class QuestionAlternativesValidator < ActiveModel::Validator
  def validate(record)
    alternatives = record.alternatives.select { |alt| alt.veracity == true }.count
    if alternatives != 1
      record.errors.add(:alternatives, :only_one_true_alternative)
    end
  end
end
