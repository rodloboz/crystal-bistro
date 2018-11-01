class BaseRepository
  def initialize(csv_file : String)
    @csv_file = csv_file
    @next_id = 1
    @elements = Array(Meal).new
    load_csv if File.exists?(csv_file)
  end

  def all
    @elements
  end

  def add(element : Meal)
    element.id = @next_id
    @next_id += 1
    @elements << element
    save_csv
  end

  def find(id)
    @elements.find { |element| element.id == id }
  end

  private def load_csv
    data = File.read @csv_file
    csv = CSV.new(data, headers: true)
    csv.each { |row| @elements << build_element(row) }
    @next_id = @elements.last.id + 1 unless @elements.empty?
  end

  private def save_csv
    csv = CSV.build do |csv|
      csv.row @elements.first.class.headers
      @elements.each { |element| csv.row element.to_csv_row }
    end
    File.write(@csv_file, csv)
  end
end
