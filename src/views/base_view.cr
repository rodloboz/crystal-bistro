class BaseView
  def display_elements(elements)
    elements.each_with_index do |element, index|
      puts "#{index + 1} - " + element.to_s
    end
  end

  def ask_for(label)
    klass_name = self.class.to_s.gsub(/sView/, "").downcase
    puts "What's the #{label} of the #{klass_name}?"
    gets.not_nil!
  end
end
