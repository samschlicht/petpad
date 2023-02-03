class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
  end

  def user_profile
    @pet_sitter = Pad.find_by(user_id: current_user.id)
    raise
  end
end
