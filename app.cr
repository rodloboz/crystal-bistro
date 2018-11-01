require "csv"
require "./src/models/meal"
require "./src/repositories/base_repository"
require "./src/repositories/meal_repository"

csv_file = "data/meals.csv"
repo = MealRepository.new csv_file: csv_file
meal = Meal.new name: "burger", price: 6
repo.add(meal)
