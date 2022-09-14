class GlassesController < ApplicationController

  skip_before_action :verify_authenticity_token
  before_action :find_user, only: %i[index create]

  def index
    render json: @user.admin ? Glass.all : @user.glasses
  end

  def create
    lense = Lense.find_by(id: glass_params[:lense_id])
    frame = Frame.find_by(id: glass_params[:frame_id], status: "active")
    if @user
      render plain: "Frame or lense is out of stock" and return unless are_in_stock?(lense, frame).present?
      @glass = Glass.create!(glass_params.merge(price: glass_price(lense, frame)))
      render status: 200, plain: "Glass Successfully created"
    else
      render status: 404, plain: "User Doesn't Exist"
    end
  end

  private

  def glass_params
    params.require(:glass).permit(:frame_id, :lense_id, :user_id)
  end

  def are_in_stock?(lense, frame)
    lense && frame && lense.stock > 0 && frame.stock > 0	
  end

  def glass_price(lense, frame)
    lense.price + frame.price
  end

  def find_user
    @user = User.find_by(id: params[:user_id])
  end

end