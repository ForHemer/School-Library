require_relative 'app'

def main
  myapp = App.new
  myapp.display_welcome
  myapp.options
end

main
