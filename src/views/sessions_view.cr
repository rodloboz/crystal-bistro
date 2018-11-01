# require 'io/console'

class SessionsView
  def ask_for_username
    puts "What's the username?"
    gets.not_nil!
  end

  def ask_for_password
    puts "What's the password?"
    gets.not_nil!
    # STDIN.noecho(&:gets).chomp
  end

  def welcome_user
    puts "You are signed in! Welcome!"
    puts ""
  end

  def wrong_credentials
    puts "Wrong credentials! Try again!"
    puts ""
  end
end
