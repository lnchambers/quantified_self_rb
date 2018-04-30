class Api::V1::FoodsController < Api::V1::BaseController

  def index
    render json: Food.all
  end

end
