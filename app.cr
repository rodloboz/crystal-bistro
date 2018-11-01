require "csv"
require "./src/models/meal"
require "./src/models/customer"
require "./src/repositories/base_repository"
require "./src/repositories/meal_repository"
require "./src/repositories/customer_repository"
require "./src/controllers/meals_controller"
require "./src/controllers/customers_controller"
require "./src/views/base_view"
require "./src/views/meals_view"
require "./src/views/customers_view"

meals_csv = "data/meals.csv"
customers_csv = "data/customers.csv"
meal_repository = MealRepository.new csv_file: meals_csv
customer_repository = CustomerRepository.new csv_file: customers_csv
meals_controller = MealsController.new(meal_repository)
customers_controller = CustomersController.new(customer_repository)

customers_controller.add
customers_controller.list
