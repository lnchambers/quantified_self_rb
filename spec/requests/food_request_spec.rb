require 'rails_helper'

describe "Food Requests" do
  before :all do
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

  it "GET /api/v1/foods/:id returns one food matching the id" do
    get "/api/v1/foods/2"

    expect(response).to be_success
    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(parsed[:name]).to eq(@food_2.name)
    expect(parsed[:calories]).to eq(@food_2.calories)
    expect(parsed[:id]).to eq(@food_2.id)
  end

  it "GET /api/v1/foods/:id returns 404 if not found" do
    get "/api/v1/foods/4"

    expect(response.status).to eq(404)
    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(parsed[:error]).to eq("Your food has been eaten and no longer exists")
  end

  it "POST /api/v1/foods creates a new food WOW" do
    params = {:food => {:name => "Chevrolet", :calories => 2}}.to_json
    headers = { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    post "/api/v1/foods", params: params, headers: headers

    expect(response).to be_success
    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(parsed[:name]).to eq("Chevrolet")
    expect(parsed[:calories]).to eq(2)
    expect(parsed[:id]).to eq(4)
  end

  it "POST /api/v1/foods returns 404 if your food sucks" do
    params = {:food => {:name => "Chevrolet"}}.to_json
    headers = { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    post "/api/v1/foods", params: params, headers: headers

    expect(response).to_not be_success
    parsed = JSON.parse(response.body, symbolize_names: true)
    expect(parsed[:error]).to eq("Your food is in the garbage. Please try again.")
  end

  it "DELETE /api/v1/foods/:id returns 204 if food successfully deleted" do
    delete "/api/v1/foods/2"

    expect(response).to be_success
    expect(response.status).to eq(204)
  end

  it "DELETE /api/v1/foods/:id returns 404 if food isn't deleted" do
    delete "/api/v1/foods/10"

    expect(response).to_not be_success
    expect(response.status).to eq(404)
  end
end
