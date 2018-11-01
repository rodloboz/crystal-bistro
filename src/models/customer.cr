class Customer
  property :id
  getter :name, :address

  def initialize(name : String, address : String, id : Int32 = 1)
    @id = id
    @name = name
    @address = address
  end

  def self.headers
    %i[id name address]
  end

  def to_s
    "Name: #{@name.capitalize} | address: #{@address.capitalize}"
  end

  def to_csv_row
    [@id, @name, @address]
  end
end
