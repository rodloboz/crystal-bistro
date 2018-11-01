class OrderRepository < BaseRepository
  def initialize(
    csv_file : String,
    meal_repository : MealRepository,
    customer_repository : CustomerRepository,
    employee_repository : EmployeeRepository
  )
    @elements = [] of Order
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    super(csv_file)
  end

  def undelivered_orders
    orders.reject { |order| order.delivered? }
  end

  def save
    save_csv
  end

  private def orders
    @elements
  end

  private def build_element(row)
    Order.new(
      id: row["id"].to_i,
      meal: @meal_repository.find(row["meal_id"].to_i).not_nil!,
      customer: @customer_repository.find(row["customer_id"].to_i).not_nil!,
      employee: @employee_repository.find(row["employee_id"].to_i).not_nil!,
      delivered: row["delivered"] == "true"
    )
  end
end
