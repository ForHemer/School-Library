require 'json'

class FileManager
  attr_reader :data

  def initialize(file_path)
    check_file(file_path)
    @file_path = file_path
    @data = fetch(file_path)
  end

  # Check if file exists
  def check_file(file_path)
    File.write(file_path, '[]') unless File.exist?(file_path)
  end

  # Fetch data from the file
  def fetch(file_path)
    file = File.read(file_path)
    JSON.parse(file)
  end

  # Save array => json file
  def save
    json = JSON.generate(@data)
    File.write(@file_path, json)
  end
end
