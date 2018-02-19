class Users::AddressesController < ApplicationController
  layout 'dashboard'
  before_action :set_address, only: [:show, :edit, :update]

  def show
  end

  def new
    @address = current_user.build_address
  end

  def edit
  end

  def create
    @address = current_user.build_address(address_params)

    respond_to do |format|
      if @address.save
        format.html { redirect_to address_path, notice: 'Endereço criado com sucesso.' }
        format.json { render :show, status: :created, location: @address }
      else
        format.html { render :new }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @address.update(address_params)
        format.html { redirect_to profile_path, notice: 'Endereço foi atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @address }
      else
        format.html { render :edit }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def set_address
      @address = current_user.address
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def address_params
      params.require(:address)
            .permit(:state, :city, :cep, :district, :street)
    end
end
