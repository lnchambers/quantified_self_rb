class Api::V1::MealsController < Api::V1::BaseController
  def index
    render json: Meal.all
  end
end
