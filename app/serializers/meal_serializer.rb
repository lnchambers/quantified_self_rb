class MealSerializer < ActiveModel::Serializer
  attributes :id, :name 
  has_many :foods, through: :meal_foods
end
