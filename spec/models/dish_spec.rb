require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end
  describe "relationships" do
    it {should belong_to :chef}
    it {should have_many :dish_ingredients}
    it {should have_many :ingredients}
  end
  describe Dish do
    describe "total_calories method" do
      it "can get total_calories" do
        chef_1 = Chef.create(name: "John")
        dish_1 = Dish.create(name: "Meatballs", description: "good food", chef_id: chef_1.id)
        ingredient_1 = Ingredient.create(name: "Meat", calories: "100")
        ingredient_2 = Ingredient.create(name: "Sauce", calories: "50")
        DishIngredient.create!(dish: dish_1, ingredient: ingredient_1)
        DishIngredient.create!(dish: dish_1, ingredient: ingredient_2)

        expect(dish_1.total_calories).to eq(150)
      end
    end
  end
end
