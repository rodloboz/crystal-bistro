class Employee
  property :id
  getter :username, :password, :role

  def initialize(username : String, password : String, role : String, id : Int32 = 1)
    @id = id
    @username = username
    @password = password
    @role = role
  end

  def delivery_guy?
    @role == "delivery_guy"
  end

  def self.headers
    %i[id username password role]
  end

  def to_s
    "Name: #{@username} | Role: #{@role}"
  end

  def to_csv_row
    [@id, @username, @password, @role]
  end
end
