class LensesController < ApplicationController

	skip_before_action :verify_authenticity_token

	def index
		render json: Lense.all
	end

	def create
		user = User.find_by(id: params[:user_id])
		if user.admin 
			Lense.create!(frame_params.except(:user_id))
			render status: 200, plain: "Lense Successfully created"
		else
			render plain: "Only Admin Can Create Lense"
		end
	end

	private

	def frame_params
		params.require(:lense).permit(:colour, :description, :prescription_type, :lense_type, :stock, :price, :user_id)
	end

end