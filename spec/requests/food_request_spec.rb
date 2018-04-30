require 'rails_helper'

describe "Food Requests" do
  before :each do
    @food = create(:food)
    @food_2 = create(:food, name: "Opakawagalaga Eupanifahorious")
    @food_3 = create(:food, name: "Benedicty Humbleburgers")
  end
  it "GET /api/v1/foods returns ALL the food" do
    get "/api/v1/foods"

    expect(response).to be_success
    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(parsed.count).to eq(3)
    expect(parsed[0][:name]).to eq(@food.name)
    expect(parsed[0][:calories]).to eq(@food.calories)
    expect(parsed[1][:name]).to eq(@food_2.name)
    expect(parsed[1][:calories]).to eq(@food_2.calories)
    expect(parsed[2][:name]).to eq(@food_3.name)
    expect(parsed[2][:calories]).to eq(@food_3.calories)
  end

  it "GET /api/v1/foods/:id returns one food matching the id or 404 if not found" do
    get "/api/v1/foods/2"

    expect(response).to be_success
    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(parsed[:name]).to eq(@food_2.name)
    expect(parsed[:calories]).to eq(@food_2.calories)
    expect(parsed[:id]).to eq(@food_2.id)
  end
end
