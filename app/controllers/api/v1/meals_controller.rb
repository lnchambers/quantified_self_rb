class Api::V1::MealsController < Api::V1::BaseController
  def index
    render json: Meal.all
  end

  def show
    render json: Meal.find(params[:id])
  rescue Exception
    render :json => { error: "Your meal has been eaten and no longer exists" }, :status => 404
  end
end
