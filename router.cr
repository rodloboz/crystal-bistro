class Router
  @current_user : Guest | Employee
  getter :sessions_controller

  def initialize(
    meals_controller : MealsController,
    customers_controller : CustomersController,
    sessions_controller : SessionsController
  )
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @sessions_controller = sessions_controller
    # @orders_controller = controllers[:orders_controller]
    @running = true
    @current_user = Guest.new
  end

  def run
    puts "Welcome to the Le Wagon Bistro!"
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
          # display_employee_tasks
          # action = gets.not_nil!.to_i
          # print `clear`
          # route_employee_action(action)
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
    when 9 then destroy_session!
    when 0 then stop
    else
      puts "Please press 1 - 4"
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
