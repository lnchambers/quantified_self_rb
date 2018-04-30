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

  private

    def food_params
      params.require(:food).permit(:name, :calories)
    end

end
