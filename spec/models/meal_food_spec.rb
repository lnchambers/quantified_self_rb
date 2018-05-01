require "rails_helper"

RSpec.describe MealFood, type: :model do
  it { should belong_to(:food) }
  it { should belong_to(:meal) } 
end
