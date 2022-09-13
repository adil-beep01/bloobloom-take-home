class FramesController < ApplicationController

	skip_before_action :verify_authenticity_token
  before_action :find_user, only: %i[index create]
	
	def index
		render json: @user.admin ? update_prices(params[:active_currency], false) : update_prices(params[:active_currency], true)
	end

	def create
		if @user.admin 
			Frame.create!(frame_params.except(:user_id))
			render status: 200, plain: "Frame Successfully created"
		else
			render plain: "Only Admin Can Create Frames"
		end
	end

	private

	def frame_params
		params.require(:frame).permit(:name, :description, :status, :stock, :price, :user_id)
	end

	def update_prices(active_currency, is_active)
		records = is_active ? Frame.active : Frame.all
		records.each_with_index do  |ele, index|
			ele.price = ele.price * Frame::CURRENCY_RATE[active_currency.to_sym]
		end
	end

	def find_user
		@user = User.find_by(id: params[:user_id])
	end

end