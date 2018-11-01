class SessionsController
  @user : Guest | Employee

  getter :employee_repository

  def initialize(employee_repository : EmployeeRepository)
    @employee_repository = employee_repository
    @user = Guest.new
    @view = SessionsView.new
  end

  def sign_in(counter = 1)
    username = @view.ask_for_username
    password = @view.ask_for_password
    @user = @employee_repository.find_by_username(username)
    if @user.is_a?(Employee) && @user.password == password
      @view.welcome_user
      @user
    else
      counter += 1
      @view.wrong_credentials
      counter <= 3 ? sign_in(counter) : Guest.new
    end
  end
end
