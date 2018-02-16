class Admin::UsersController < Admin::BaseController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authorize_user
  respond_to :html

  def index
    @users = Kaminari.paginate_array(User.includes(:profile).order(:id).decorate)
                     .page(params[:page]).per(10)
  end

  def show
  end

  def new
    @user = User.new
    @user.build_profile
    @user.build_address
  end

  def edit
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to admin_user_path(@user), notice: 'Usuário criado com sucesso.'
    else
      render :new
    end    
  end

  def update
    if @user.update(user_params)
      redirect_to [:admin, @user], notice: 'Usuário atualizado com sucesso'
    else
      render :edit
    end
  end

  def destroy
    @user.destroy

    redirect_to users_url, notice: 'Usuário foi apagado com sucesso.'
  end

  def ban
    @user = User.find(params[:id])
    status = (@user.banned?) ? false : true
    @user.update_attribute(:banned, status)
    redirect_to admin_user_path, notice: "Usuário #{(status == true) ? "banido" : "ativo"}."
  end

  private

    def authorize_user
      authorize User
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id]).decorate
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user)
        .permit(:email, :password, :password_confirmation, :kind,
          profile_attributes: [:first_name, :last_name, :phone, :birthday, :sex, :avatar, :remove_avatar],
          address_attributes: [:state, :city, :cep, :district, :street])
    end
end
