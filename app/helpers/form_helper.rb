module FormHelper
  def progress_bar
    content_tag(:ul, class: "nav nav-process-steps nav-process-steps-icons") do
      wizard_steps.collect do |every_step|
        class_str = ""
        class_str = "current"  if every_step == step
        class_str = "finished" if past_step?(every_step)
        concat(
          content_tag(:li, class: "nav-item #{class_str}") do
            concat(content_tag(:span, class: "nav-title") do
              concat every_step
            end)
            concat link_to "", wizard_path(every_step), class: "nav-link"
          end
        )
      end
    end
  end
end
