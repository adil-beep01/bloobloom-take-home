class FramesController < ApplicationController

	skip_before_action :verify_authenticity_token

	def index
		render json: Frame.all
	end

	def create
		user = User.find_by(id: params[:user_id])
		if user.admin 
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

end