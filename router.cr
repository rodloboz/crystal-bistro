class Router
  def initialize(
    meals_controller : MealsController,
    customers_controller : CustomersController
  )
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    # @sessions_controller = controllers[:sessions_controller]
    # @orders_controller = controllers[:orders_controller]
    @running = true
  end

  def run
    puts "Welcome to the Le Wagon Bistro!"
    puts "           --           "

    while @running
      display_tasks
      action = gets.not_nil!.to_i
      print `clear`
      route_action(action)
    end
  end

  private def route_action(action : Int32)
    case action
    when 1 then @meals_controller.list
    when 2 then @meals_controller.add
    when 3 then @customers_controller.list
    when 4 then @customers_controller.add
    when 0 then stop
    else
      puts "Please press 1 - 4"
    end
  end

  private def stop
    @running = false
  end

  private def display_tasks
    puts "###############################"
    puts "##      LE WAGON BISTRO.     ##"
    puts "###############################"
    puts "What do you want to do?"
    puts "1 - List all meals"
    puts "2 - Create a new meal"
    puts "3 - List all customers"
    puts "4 - Create a new customer"
    puts "0 - Stop and exit the program"
  end
end
