class MealsController
  def initialize(meal_repository : MealRepository)
    @meal_repository = meal_repository
    @view = MealsView.new
  end

  def list
    meals = @meal_repository.all
    @view.display_elements(meals)
  end

  def add
    name = @view.ask_for :name
    price = @view.ask_for :price
    meal = Meal.new name: name, price: price.to_i
    @meal_repository.add meal
  end
end
