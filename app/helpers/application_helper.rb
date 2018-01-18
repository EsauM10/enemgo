module ApplicationHelper

  def present_controllers?(controllers = [])
    controllers.include?(controller_name) || devise_controller?
  end

  def flash_class(level)
    case level
    when 'notice'   then 'alert-info'
    when 'success'  then 'alert-success'
    when 'error'    then 'alert-danger'
    when 'alert'    then 'alert-warning'
    end
  end
end
