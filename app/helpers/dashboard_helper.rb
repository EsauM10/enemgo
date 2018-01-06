module DashboardHelper
  def render_options_menu
    case current_user.kind
    when 'student'
      render 'admin/dashboard/menu'
    when 'admin'
      render 'student/dashboard/menu'
    end
  end
end
