class OrdersController
  @meal_repository : MealRepository
  @employee_repository : EmployeeRepository
  @customer_repository : CustomerRepository
  @order_repository : OrderRepository
  @view : OrdersView

  def initialize(meal_repository, employee_repository, customer_repository, order_repository)
    @meal_repository = meal_repository
    @employee_repository = employee_repository
    @order_repository = order_repository
    @customer_repository = customer_repository
    @view = OrdersView.new
  end

  def list
    orders = @order_repository.all
    @view.display_elements(orders)
  end

  def list_undelivered_orders
    orders = @order_repository.undelivered_orders
    @view.display_elements(orders)
  end

  def list_my_orders(employee)
    return [] of Order if employee.is_a?(Guest)
    orders = @order_repository.undelivered_orders
    orders = orders.select { |order| order.employee.id == employee.id }
    @view.display_elements(orders)
  end

  def mark_as_delivered(employee)
    orders = list_my_orders(employee).not_nil!
    order_index = @view.ask_for(:id).to_i - 1
    order_id = orders[order_index].id
    order = @order_repository.find(order_id).not_nil!
    order.deliver!
    @order_repository.save
  end

  def add
    meals = @meal_repository.all
    @view.display_elements(meals)
    meal_index = @view.ask_for(:id).to_i - 1
    meal_id = meals[meal_index].id
    meal = @meal_repository.find(meal_id)

    customers = @customer_repository.all
    @view.display_elements(customers)
    customer_index = @view.ask_for(:id).to_i - 1
    customer_id = customers[customer_index].id
    customer = @customer_repository.find(customer_id)

    employees = @employee_repository.all_delivery_guys
    @view.display_elements(employees)
    employee_index = @view.ask_for(:id).to_i - 1
    employee_id = employees[employee_index].id
    employee = @employee_repository.find(employee_id)

    order = Order.new(
      meal: meal,
      customer: customer,
      employee: employee
    )

    @order_repository.add(order)
  end
end
