ActiveRecord::Base.logger = nil

class Interface

  def self.welcome
    Artscii.welcome
    "\n\nWelcome to Mini-Muse! The data analytics app for the 500 greatest albums of all time.\n"
    self.get_input
  end

  def get_input
    user_input = nil
    while true
      user_input = gets.chomp
      puts "What would you like to learn about today?"
      case user_input
      when "1"
      end
    end
  end
end
