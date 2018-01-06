module DashboardHelper
  def render_options_menu
    case current_user.kind
    when 'student'
      render 'student/dashboard/menu'
    when 'admin'
      render 'admin/dashboard/menu'
    end
  end
end
