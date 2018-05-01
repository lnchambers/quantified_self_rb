require 'rails_helper'

describe "Meal Requests" do
  before :all do
    @meal = create(:meal)
    @meal_2 = create(:meal, name: "Brunch")
    @meal_3 = create(:meal, name: "Din Her")
    @food = create(:food)
    @food_2 = create(:food, name: "Calories galore!")
    @food_3 = create(:food, name: "Browser Based Cookies")
    @meal_foods = MealFood.create!(food: @food, meal: @meal_3)
    @meal_foods_2 = MealFood.create!(food: @food_2, meal: @meal_3)
    @meal_foods_3 = MealFood.create!(food: @food_3, meal: @meal)
    @meal_foods_4 = MealFood.create!(food: @food_2, meal: @meal)
    @meal_foods_5 = MealFood.create!(food: @food, meal: @meal_3)
    @meal_foods_6 = MealFood.create!(food: @food_2, meal: @meal_2)
    @meal_foods_7 = MealFood.create!(food: @food_3, meal: @meal_2)
  end
  it "GET /api/v1/meals should return all meals" do
    get "/api/v1/meals"

    expect(response).to be_success
    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(parsed[0][:name]).to eq(@meal.name)
    expect(parsed[0][:foods][0][:name]).to eq(@food_3.name)
    expect(parsed[0][:foods][1][:name]).to eq(@food_2.name)
    expect(parsed[1][:name]).to eq(@meal_2.name)
    expect(parsed[1][:foods][0][:name]).to eq(@food_2.name)
    expect(parsed[1][:foods][1][:name]).to eq(@food_3.name)
    expect(parsed[2][:name]).to eq(@meal_3.name)
    expect(parsed[2][:foods][0][:name]).to eq(@food.name)
    expect(parsed[2][:foods][1][:name]).to eq(@food_2.name)
    expect(parsed[2][:foods][2][:name]).to eq(@food.name)
  end

  it "GET /api/v1/meals/:meal_id/foods returns all the foods that belong to a certain meal" do
    get "/api/v1/meals/#{@meal_2.id}/foods"

    expect(response).to be_success
    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(parsed[:id]).to eq(@meal_2.id)
    expect(parsed[:name]).to eq(@meal_2.name)
    expect(parsed[:foods][0][:name]).to eq(@food_2.name)
  end

  it "POST /api/v1/meals/:meal_id/foods/:id should create a food under a meal" do
    post "/api/v1/meals/#{@meal_2.id}/foods/#{@food.id}"

    expect(response).to be_success
    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(parsed[:message]).to eq("Successfully added #{@food.name} to #{@meal_2.name}")
  end
end
