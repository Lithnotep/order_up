require 'rails_helper'

RSpec.describe "Chefs Show Page" do
  describe "When I visit '/chefs/:id'" do
    it "I see that a chef has ingredients" do
      chef_1 = Chef.create(name: "John")
      dish_1 = Dish.create(name: "Meatballs", description: "good food", chef_id: chef_1.id)
      dish_2 = Dish.create(name: "Spagetti", description: "good food", chef_id: chef_1.id)
      ingredient_1 = Ingredient.create(name: "Meat", calories: "100")
      ingredient_2 = Ingredient.create(name: "Sauce", calories: "50")
      DishIngredient.create!(dish: dish_1, ingredient: ingredient_1)
      DishIngredient.create!(dish: dish_1, ingredient: ingredient_2)
      DishIngredient.create!(dish: dish_2, ingredient: ingredient_2)



      visit "/chefs/#{chef_1.id}"

      expect(page).to have_content(chef_1.name)
      click_on "Ingredients"
      expect(current_path).to eq("/chef_ingredients/#{chef_1.id}")
      expect(page).to have_content(ingredient_1.name)
      expect(page).to have_content(ingredient_2.name)
    end
  end
end
