require 'rails_helper'

RSpec.describe Meal, type: :model do
  it { should have_many(:meal_foods) }
  it { should have_many(:foods).through(:meal_foods) }
  it { should validate_presence_of(:name) }
end
