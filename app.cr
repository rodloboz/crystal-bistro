require "csv"
require "./src/models/meal"
require "./src/repositories/base_repository"
require "./src/repositories/meal_repository"
require "./src/controllers/meals_controller"
require "./src/views/base_view"
require "./src/views/meals_view"

csv_file = "data/meals.csv"
meal_repository = MealRepository.new csv_file: csv_file
meals_controller = MealsController.new(meal_repository)

meals_controller.add
meals_controller.list
