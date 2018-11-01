class EmployeeRepository < BaseRepository
  def initialize(csv_file : String)
    @elements = [] of Employee
    super
  end

  def find_by_username(username)
    employee = employees.find { |employee| employee.username == username }
    employee || Guest.new
  end

  def all_delivery_guys
    employees.select { |employee| employee.delivery_guy? }
  end

  private def employees
    @elements
  end

  private def build_element(row)
    Employee.new(
      id: row["id"].to_i,
      username: row["username"],
      password: row["password"],
      role: row["role"]
    )
  end
end
