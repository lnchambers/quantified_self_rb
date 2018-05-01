require 'rails_helper'

RSpec.describe Food, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:calories) }
  it { should validate_uniqueness_of(:name) }
  it { should have_many(:meal_foods) }
  it { should have_many(:meals).through(:meal_foods) }
end
