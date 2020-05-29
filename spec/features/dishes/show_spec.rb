require 'rails_helper'

RSpec.describe "Dishes Show Page" do
  describe "When I visit '/dishes/:id'" do
    it "I see that a dish has ingredients" do
      chef_1 = Chef.create(name: "John")
      dish_1 = Dish.create(name: "Meatballs", description: "good food", chef_id: chef_1.id)
      ingredient_1 = Ingredient.create(name: "Meat", calories: "100")
      ingredient_2 = Ingredient.create(name: "Sauce", calories: "50")
      DishIngredient.create!(dish: dish_1, ingredient: ingredient_1)
      DishIngredient.create!(dish: dish_1, ingredient: ingredient_2)


      visit "/dishes/#{dish_1.id}"

      expect(page).to have_content(dish_1.name)
      expect(page).to have_content(ingredient_1.name)
      expect(page).to have_content(ingredient_1.name)
      expect(page).to have_content(chef_1.name)
    end
  end
end
