class Api::V1::FoodsController < Api::V1::BaseController

  def index
    render json: Food.all
  end

  def show
    render json: Food.find(params[:id])
  rescue Exception
    render :json => { error: "Your food has been eaten and no longer exists" }, :status => 404
  end

end
