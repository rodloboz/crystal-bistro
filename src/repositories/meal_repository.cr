class MealRepository < BaseRepository
  def initialize(csv_file : String)
    @elements = [] of Meal
    super
  end

  private def build_element(row)
    Meal.new(
      id: row["id"].to_i,
      name: row["name"],
      price: row["price"].to_i
    )
  end
end
