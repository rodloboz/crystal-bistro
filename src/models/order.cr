class Order
  getter meal : Meal, customer : Customer, employee : Employee
  property id : Int32
  @delivered : Bool

  def initialize(meal, customer, employee, delivered = false, id = 1)
    @id = id
    @meal = meal.not_nil!
    @customer = customer.not_nil!
    @employee = employee.not_nil!
    @delivered = delivered.not_nil!
  end

  def delivered?
    @delivered
  end

  def deliver!
    @delivered = true
  end

  def self.headers
    %i[id delivered meal_id customer_id employee_id]
  end

  def to_s
    "Meal: #{@meal.name.capitalize} | Deliver to: #{@customer.name.capitalize} | Delivery by: #{@employee.username.capitalize} | Delivered: #{delivered? ? "[X]" : "[ ]"}"
  end

  def to_csv_row
    [@id, @delivered, @meal.id, @customer.id, @employee.id]
  end
end
