require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end
  describe "relationships" do
    it {should have_many :dishes}
  end
  describe Chef do
    describe "chef_ingredients method" do
      it "can get chef ingredients" do
        chef_1 = Chef.create(name: "John")
        dish_1 = Dish.create(name: "Meatballs", description: "good food", chef_id: chef_1.id)
        dish_2 = Dish.create(name: "Spagetti", description: "good food", chef_id: chef_1.id)
        ingredient_1 = Ingredient.create(name: "Meat", calories: "100")
        ingredient_2 = Ingredient.create(name: "Sauce", calories: "50")
        DishIngredient.create!(dish: dish_1, ingredient: ingredient_1)
        DishIngredient.create!(dish: dish_1, ingredient: ingredient_2)
        DishIngredient.create!(dish: dish_2, ingredient: ingredient_2)

        expect(chef_1.chef_ingredients).to eq(["Meat", "Sauce"])
      end
    end
  end
end
