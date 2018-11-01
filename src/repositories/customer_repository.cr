class CustomerRepository < BaseRepository
  def initialize(csv_file : String)
    @elements = [] of Customer
    super
  end

  private def build_element(row)
    Customer.new(
      id: row["id"].to_i,
      name: row["name"],
      address: row["address"]
    )
  end
end
