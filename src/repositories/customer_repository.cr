class CustomerRepository < BaseRepository
  private def build_element(row)
    Customer.new(
      id: row["id"].to_i,
      name: row["name"],
      address: row["address"]
    )
  end
end
