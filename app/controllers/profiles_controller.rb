class ProfilesController < ApplicationController
  def show
    @profile = current_user
    authorize @profile
  end


 private

  def authorize_profile
    authorize @profile
  end

end
