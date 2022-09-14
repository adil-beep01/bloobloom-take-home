class LensesController < ApplicationController

  skip_before_action :verify_authenticity_token
  before_action :find_user, only: %i[index create]

  def index
    render json: update_prices(params[:active_currency])
  end

  def create
    if @user.admin
      Lense.create!(lense_params.except(:user_id))
      render status: 200, plain: "Lense Successfully created"
    else
      render plain: "Only Admin Can Create Lense"
    end
  end

  private

  def lense_params
    params.require(:lense).permit(:colour, :description, :prescription_type, :lense_type, :stock, :price, :user_id)
  end

  def update_prices(active_currency)
    Lense.all.each_with_index do  |ele, index|
      ele.price = ele.price * Lense::CURRENCY_RATE[active_currency.to_sym]
    end
  end

  def find_user
    @user = User.find_by(id: params[:user_id])
  end

end