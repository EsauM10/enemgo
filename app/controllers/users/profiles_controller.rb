class Users::ProfilesController < ApplicationController
  layout 'dashboard'
  before_action :set_profile, only: [:show, :edit, :update]  

  def show
  end

  def new
    @profile = current_user.build_profile
  end

  def edit
  end

  def create
    @profile = current_user.build_profile(profile_params)

    respond_to do |format|
      if @profile.save
        format.html { redirect_to profile_path(current_user.kind), notice: 'Profile was successfully created.' }
        format.json { render :show, status: :created, location: @profile }
      else
        format.html { render :new }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to profile_path(current_user.kind), notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def set_profile
      @profile = current_user.profile
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params.require(:profile)
            .permit(:first_name, :last_name, :phone, :birthday, :avatar, :remove_avatar)
    end
end
