require "csv"
require "./src/models/meal"
require "./src/models/customer"
require "./src/models/employee"
require "./src/models/order"
require "./src/models/guest"
require "./src/repositories/base_repository"
require "./src/repositories/meal_repository"
require "./src/repositories/customer_repository"
require "./src/repositories/employee_repository"
require "./src/repositories/order_repository"
require "./src/controllers/meals_controller"
require "./src/controllers/customers_controller"
require "./src/controllers/orders_controller"
require "./src/controllers/sessions_controller"
require "./src/views/base_view"
require "./src/views/meals_view"
require "./src/views/customers_view"
require "./src/views/orders_view"
require "./src/views/sessions_view"
require "./router"

meals_csv = "data/meals.csv"
customers_csv = "data/customers.csv"
employees_csv = "data/employees.csv"
orders_csv = "data/orders.csv"
meal_repository = MealRepository.new csv_file: meals_csv
customer_repository = CustomerRepository.new csv_file: customers_csv
employee_repository = EmployeeRepository.new csv_file: employees_csv
order_repository = OrderRepository.new(
  csv_file: orders_csv,
  meal_repository: meal_repository,
  customer_repository: customer_repository,
  employee_repository: employee_repository
)
meals_controller = MealsController.new(meal_repository)
customers_controller = CustomersController.new(customer_repository)
customers_controller = CustomersController.new(customer_repository)
orders_controller = OrdersController.new(
  meal_repository,
  employee_repository,
  customer_repository,
  order_repository
)
sessions_controller = SessionsController.new(employee_repository)

router = Router.new(
  meals_controller,
  customers_controller,
  orders_controller,
  sessions_controller)

router.run
