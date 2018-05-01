class Api::V1::MealsController < Api::V1::BaseController
  def index
    render json: Meal.all
  end

  def show
    render json: Meal.find(params[:meal_id])
  rescue Exception
    render :json => { error: "Your meal has been eaten and no longer exists" }, :status => 404
  end

  def create
    meal = Meal.find(params[:meal_id])
    food = Food.find(params[:id])
    meal_food = MealFood.new(food: food, meal: meal)
    if meal_food.save
      render :json => { message: "Successfully added #{food.name} to #{meal.name}" }
    else
      render :json => { error: "Your food has no power here!" }, :status => 404
    end
  rescue Exception
    render :json => { error: "Your food has no power here!" }, :status => 404
  end

  def destroy
    meal = Meal.find(params[:meal_id])
    food = Food.find(params[:id])
    meal_food = MealFood.find_by(food: food, meal: meal)
    if meal_food.destroy!
      render :json => { message: "Successfully removed #{food.name} from #{meal.name}" }
    else
      render :json => { error: "This is awkward. You can't delete something that doesn't exist" }, :status => 404
    end
  rescue Exception
    render :json => { error: "This is awkward. You can't delete something that doesn't exist" }, :status => 404
  end
end
