require_relative 'app'

def main
  myApp = App.new
  myApp.display_welcome()
  myApp.options()
end

main
