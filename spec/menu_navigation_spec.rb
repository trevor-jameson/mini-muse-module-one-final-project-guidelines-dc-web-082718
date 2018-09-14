# Encountering error with dependency file.

require_relative "../lib/menu_navigation.rb"
require_relative "lib/ascii_art.rb"

describe 'ScreenNavigationChecker' do
  let (:checker) {Screen.new}

  it "clears the screen when self.next is run" do
    expect($stdout).to receive(:puts).with("\ec\e[3J")
    Interface.clear
   end

   it "pauses until the user enters some input" do
     expect($stdout).to receive # Whatever arguement is used to expect a while loop...
     Interface.next
 end
end

describe "InterfaceNavigationChecker" do
  let (:checker) {Interface.new}

  it "welcomes the user upon opening mini muse" do
    expect($stdout).to receive(:print).with("Welcome to Mini-Muse! The data analytics app for the 500 greatest albums of all time.\n\nEnter any key to begin: ")
    Interface.welcome
  end
end
