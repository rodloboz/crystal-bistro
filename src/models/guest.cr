class Guest
  @password : String
  @role : String
  getter :password, :role

  def initialize
    @password = ""
    @role = "guest"
  end
end
