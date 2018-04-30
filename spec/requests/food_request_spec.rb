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
    expect(parsed[1][:name]).to eq(@food_2.name)
    expect(parsed[2][:name]).to eq(@food_3.name)
  end
end
