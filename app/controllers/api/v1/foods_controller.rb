class Api::V1::FoodsController < Api::V1::BaseController

  def index
    render json: Food.all
  end

  def show
    render json: Food.find(params[:id])
  rescue Exception
    render :json => { error: "Your food has been eaten and no longer exists" }, :status => 404
  end

  def create
    food = Food.new(food_params)
    if food.save
      render json: food
    else
      render :json => { error: "Your food is in the garbage. Please try again." }, :status => 404
    end
  end

  def destroy
    food = Food.find(params[:id])
    food.destroy!
    render :json => { success: "The food has been destroyed permanently." }, :status => 204
  rescue Exception
    render :json => { error: "Well, this is awkward. The food already doesn't exist." }, :status => 404
  end

  def update
    food = Food.find(params[:id])
    food.update(food_params)
    if food.save
      render json: food
    else
      render :json => { error: "The recipe says no. Please try again" }, :status => 404
    end
  rescue Exception
    render :json => { error: "The recipe says no. Please try again" }, :status => 404
  end

  private

    def food_params
      params.require(:food).permit(:name, :calories)
    end

end
