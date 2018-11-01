class Router
  @current_user : Guest | Employee
  getter :sessions_controller

  def initialize(
    meals_controller : MealsController,
    customers_controller : CustomersController,
    orders_controller : OrdersController,
    sessions_controller : SessionsController
  )
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @sessions_controller = sessions_controller
    @orders_controller = orders_controller
    @running = true
    @current_user = Guest.new
  end

  def run
    puts "Welcome to the Crystal Bistro!"
    puts "           --           "

    while @running
      @current_user = @sessions_controller.sign_in
      while @current_user.is_a?(Employee)
        if @current_user.role == "manager"
          display_manager_tasks
          action = gets.not_nil!.to_i
          print `clear`
          route_manager_action(action)
        else
          display_employee_tasks
          action = gets.not_nil!.to_i
          print `clear`
          route_employee_action(action)
        end
      end
    end
  end

  private def route_manager_action(action : Int32)
    case action
    when 1 then @meals_controller.list
    when 2 then @meals_controller.add
    when 3 then @customers_controller.list
    when 4 then @customers_controller.add
    when 5 then @orders_controller.list
    when 6 then @orders_controller.list_undelivered_orders
    when 7 then @orders_controller.add
    when 9 then destroy_session!
    when 0 then stop
    else
      puts "Please press 1 - 7"
    end
  end

  private def route_employee_action(action)
    case action
    when 1 then @orders_controller.list_my_orders(@current_user)
    when 2 then @orders_controller.mark_as_delivered(@current_user)
    when 9 then destroy_session!
    when 0 then stop
    else
      puts "Please press 1 - 2"
    end
  end

  private def stop
    destroy_session!
    @running = false
  end

  private def destroy_session!
    @current_user = Guest.new
  end

  private def display_manager_tasks
    puts "###############################"
    puts "##      CRYSTAL BISTRO       ##"
    puts "###############################"
    puts "What do you want to do?"
    puts "1 - List all meals"
    puts "2 - Create a new meal"
    puts "3 - List all customers"
    puts "4 - Create a new customer"
    puts "5 - List all orders"
    puts "6 - List undelivered orders"
    puts "7 - Create a new order"
    puts "9 - Logout"
    puts "0 - Stop and exit the program"
  end

  private def display_employee_tasks
    puts "###############################"
    puts "##      CRYSTAL BISTRO       ##"
    puts "###############################"
    puts "What do you want to do?"
    puts "1 - List my undelivered orders"
    puts "2 - Mark order as delivered"
    puts "9 - Log out"
    puts "0 - Stop and exit the program"
  end
end
