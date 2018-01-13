class Admin::HistoryController < Admin::BaseController
  def index
    authorize [:admin, :history]
    @versions = PaperTrail::Version.where('whodunnit IS NOT ?', nil)
                                    .order('created_at DESC')
                                    .includes(:item)
    user_ids = @versions.collect(&:whodunnit).reject(&:blank?).map(&:to_i).uniq
    @version_users = User.where(id: user_ids)
  end
end
