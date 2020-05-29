# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
DishIngredient.destroy_all
Dish.destroy_all
Ingredient.destroy_all
Chef.destroy_all

chef_1 = Chef.create(name: "John")
dish_1 = Dish.create(name: "Meatballs", description: "good food", chef_id: chef_1.id)
dish_2 = Dish.create(name: "Spagetti", description: "good food", chef_id: chef_1.id)
ingredient_1 = Ingredient.create(name: "Meat", calories: "100")
ingredient_2 = Ingredient.create(name: "Sauce", calories: "50")
DishIngredient.create!(dish: dish_1, ingredient: ingredient_1)
DishIngredient.create!(dish: dish_1, ingredient: ingredient_2)
DishIngredient.create!(dish: dish_2, ingredient: ingredient_2)
