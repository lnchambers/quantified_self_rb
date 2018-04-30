require 'rails_helper'

RSpec.describe Food, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:calories) }
  it { should validate_uniqueness_of(:name) }
end
