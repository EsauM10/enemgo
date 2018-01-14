module QuestionsHelper

  AREA = [
    ["Matemática e suas tecnologias", 1],
    ["Ciências humanas e suas tecnologias", 2],
    ["Linguagens, códigos e suas tecnologias", 3],
    ["Ciências da natureza e suas tecnologias", 4]
  ]

  def options_for_area(selected)
    options_for_select(AREA, selected)
  end

end
