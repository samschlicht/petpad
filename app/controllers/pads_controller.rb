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
    @padpictures = ['pads/71MboshaisL.jpg', 'pads/71xnX1sKTTS._AC_SL1500_.jpg', 'pads/628ee6c06a5af245146626_w803h620.webp', 'pads/1000_F_275733004_ASmLOPFcapcxHg6xdui5B7DNc5HM2MD3.jpg', 'pads/constructed-with-rot-resistant-fir-timber-requires-very-little-maintenance.jpg', 'pads/d8297fabeda7f1880ef08532befcfe4626-petsfit-outdoor-triangle-cat-house-.rsquare.w700.jpg.webp', 'pads/images.jpeg', 'pads/Long-Plush-Dog-Bed-Pet-Blanket-Soft-Fleece-Cat-Cushion-Puppy-Chihuahua-Sofa-Mat-Pad-For_1080x.jpg', 'pads/modern-dog-kennel-au.jpg', 'pads/s-l500.jpg', 'pads/sloth-forest-scaled.jpg', 'pads/Stacey-Cat-Enclosure.jpg']
    @pads = Pad.all
    authorize @pads
  end

  def show
    @pad = Pad.find_by(id: params[:id])
    if @pad.nil?
      flash[:alert] = "Pad not found"
      redirect_to pads_path
    end
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
