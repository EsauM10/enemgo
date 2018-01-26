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

  def active_for(options = {})
    controller    = options[:controller] || nil
    action        = options[:action]     || nil
    request_path  = options[:path]       || nil

    if request_path.nil?
      'active' if (action.nil? || action == action_name) && controller == controller_name
    else
      'active' if request_path == request.path
    end
  end

end
