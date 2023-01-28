class PadsController < ApplicationController
  # before_action :set_list

  def new
    pad_policy_authorize
    @pad = Pad.new
  end

  def create
    @pad = Pad.new(pad_params)
    if @pad.save
      redirect_to @pad
    else
      render :new
    end
  end

  def edit
  end

  def index
    @padpictures = ['71MboshaisL.jpg', '71xnX1sKTTS._AC_SL1500_.jpg', '628ee6c06a5af245146626_w803h620.webp', '1000_F_275733004_ASmLOPFcapcxHg6xdui5B7DNc5HM2MD3.jpg', 'constructed-with-rot-resistant-fir-timber-requires-very-little-maintenance.jpg', 'Long-Plush-Dog-Bed-Pet-Blanket-Soft-Fleece-Cat-Cushion-Puppy-Chihuahua-Sofa-Mat-Pad-For_1080x.jpg', 'modern-dog-kennel-au.jpg', 's-l500.jpg', 'sloth-forest-scaled.jpg', 'Stacey-Cat-Enclosure.jpg', 'z61Dcak+uVPL.jpg', 'zc46aee_ea1a45a149da4446a2bbc8a2d0177d0a_mv2.jpg', 'ze2eec0f11dd7cca52b6601143f4f5f3b.jpg.optimal.jpg', 'zil_fullxfull.3756600185_gno4.jpg.webp', 'z111.jpg', 'zpurroom-little-chicken-series-milk-box-scratching-house-pawpawup-1_cleanup.jpg.webp', 'zs-l1600.jpg', 'zscale;webp=auto;jpeg_quality=60.jpg.webp', 'zUnknown.jpg']
    @pads = policy_scope(Pad)
  end

  def show
    @pad = Pad.find(params[:id])
    pad_policy_authorize
    if @pad.nil?
      flash[:alert] = "Pad not found"
      redirect_to pads_path
    end
    @booking = Booking.new
  end

  def update
  end

  def destroy
  end

  private
  def strong_params
    params.require(:pad).permit(:address, :title, :description, :price_per_night, :capacity, :availability, :photo)
  end

  def pad_policy_authorize
    authorize @pad
  end
end
