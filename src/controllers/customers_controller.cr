class CustomersController
  def initialize(customer_repository : CustomerRepository)
    @customer_repository = customer_repository
    @view = CustomersView.new
  end

  def list
    customers = @customer_repository.all
    @view.display_elements(customers)
  end

  def add
    name = @view.ask_for :name
    address = @view.ask_for :address
    customer = Customer.new name: name, address: address
    @customer_repository.add customer
  end
end
