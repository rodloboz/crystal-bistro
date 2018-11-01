class Meal
  property :id
  getter :name, :price

  def initialize(name : String, price : Int32, id : Int32 = 1)
    @id = id
    @name = name
    @price = price
  end

  def self.headers
    %i[id name price]
  end

  def to_s
    "Name: #{@name.capitalize} | Price: #{@price}"
  end

  def to_csv_row
    [@id, @name, @price]
  end
end
