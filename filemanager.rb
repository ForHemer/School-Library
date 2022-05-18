require 'json'

class FileManager
  attr_reader :data

  def initialize(file_path)
    @data = []
    @file_path = file_path
  end

  # Check if file exists
  def check_file
    unless File.exists?(@file_path)
      File.write(@file_path, '[]')
    end
  end

  # Fetch data from the file
  def fetch
    file = File.read(@file_path)
    @data = JSON.parse(file)
    @data
  end
  
  # Save array => json file
  def save(array)
    @data = array
    json = JSON.generate(array)
    File.write(@file_path, json)
  end
end