class PadsController < ApplicationController
  # before_action :set_list

  def new
    @pad = Pad.new
    pad_policy_authorize
  end

  def create
    @pad = Pad.new(pad_params)
    @pad.user = current_user
    @pad.save
    pad_policy_authorize
    if @pad.save
      redirect_to pad_path(@pad)
    else
      render :new
    end
  end

  def edit
    @pad = Pad.find(params[:id])
    pad_policy_authorize
  end

  def update
    @pad = Pad.find(params[:id])
    pad_policy_authorize
    if @pad.update(pad_params)
      redirect_to pad_path(@pad)
    else
      flash.now[:error] = "Your pad could not be updated"
      render :edit
    end
  end



  def index
    @padpictures = ['71MboshaisL.jpg', '71xnX1sKTTS._AC_SL1500_.jpg', '628ee6c06a5af245146626_w803h620.webp', '1000_F_275733004_ASmLOPFcapcxHg6xdui5B7DNc5HM2MD3.jpg', 'constructed-with-rot-resistant-fir-timber-requires-very-little-maintenance.jpg', 'Long-Plush-Dog-Bed-Pet-Blanket-Soft-Fleece-Cat-Cushion-Puppy-Chihuahua-Sofa-Mat-Pad-For_1080x.jpg', 'modern-dog-kennel-au.jpg', 's-l500.jpg', 'sloth-forest-scaled.jpg', 'Stacey-Cat-Enclosure.jpg', 'z61Dcak+uVPL.jpg', 'zc46aee_ea1a45a149da4446a2bbc8a2d0177d0a_mv2.jpg', 'ze2eec0f11dd7cca52b6601143f4f5f3b.jpg.optimal.jpg', 'zil_fullxfull.3756600185_gno4.jpg.webp', 'z111.jpg', 'zpurroom-little-chicken-series-milk-box-scratching-house-pawpawup-1_cleanup.jpg.webp', 'zs-l1600.jpg', 'zscale;webp=auto;jpeg_quality=60.jpg.webp', 'zUnknown.jpg']
    if params.present?
      @pads_pets = policy_scope(Pad).geocoded.where("welcome_species ILIKE ?", "%#{params[:welcome_species]}%")
      @pads = @pads_pets.where("address ILIKE ?", "%#{params[:query]}%")
    else
      @pads = policy_scope(Pad).geocoded
    end
    @markers = @pads.map do |pad|
      {
        lat: pad.latitude,
        lng: pad.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {pad: pad}),
        image_url: helpers.asset_url("logo.png"),
        marker_html: render_to_string(partial: "marker", locals: {pad:pad})
      }
    end
  end

  def show
    @padpictures = ['71MboshaisL.jpg', '71xnX1sKTTS._AC_SL1500_.jpg', '628ee6c06a5af245146626_w803h620.webp', '1000_F_275733004_ASmLOPFcapcxHg6xdui5B7DNc5HM2MD3.jpg', 'constructed-with-rot-resistant-fir-timber-requires-very-little-maintenance.jpg', 'Long-Plush-Dog-Bed-Pet-Blanket-Soft-Fleece-Cat-Cushion-Puppy-Chihuahua-Sofa-Mat-Pad-For_1080x.jpg', 'modern-dog-kennel-au.jpg', 's-l500.jpg', 'sloth-forest-scaled.jpg', 'Stacey-Cat-Enclosure.jpg', 'z61Dcak+uVPL.jpg', 'zc46aee_ea1a45a149da4446a2bbc8a2d0177d0a_mv2.jpg', 'ze2eec0f11dd7cca52b6601143f4f5f3b.jpg.optimal.jpg', 'zil_fullxfull.3756600185_gno4.jpg.webp', 'z111.jpg', 'zpurroom-little-chicken-series-milk-box-scratching-house-pawpawup-1_cleanup.jpg.webp', 'zs-l1600.jpg', 'zscale;webp=auto;jpeg_quality=60.jpg.webp', 'zUnknown.jpg']
    @pad = Pad.find(params[:id])
    pad_policy_authorize
    if @pad.nil?
      flash[:alert] = "Pad not found"
      redirect_to pads_path
    end
    @booking = Booking.new
  end


  def destroy
  end

  # def welcome_species(pad)
  #   if pad.welcome_species.include? 'dogs'
  #     '🐶'
  #   end
  #   if pad.welcome_species.include? 'snakes'
  #     '🐍'
  #   end
  #   if pad.welcome_species.include? 'lizards'
  #     '🦎'
  #   end
  #   if pad.welcome_species.include? 'birds'
  #     '🦜'
  #   end
  #   if pad.welcome_species.include? 'cats'
  #     '🐈'
  #   end
  # end

  private

  def pad_params
    params.require(:pad).permit(:address, :title, :description, :price_per_night, :capacity, :availability, :photo, :welcome_species)
  end

  def pad_policy_authorize
    authorize @pad
  end
end
