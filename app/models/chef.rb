class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes

  def chef_ingredients
    all_ingredients = dishes.map do |dish|
      dish.ingredients.map do |ingredient|
        ingredient.name
      end
    end
    all_ingredients.flatten
  end
end
