require_relative 'filemanager'
require_relative 'student'

class StudentManager < FileManager
  def initialize
    super('data/students.json')
  end

  def extract_students(students)
    new_data = []
    students.each do |student|
      new_data << { age: student.age, name: student.name, parent_permission: student.parent_permission }
    end
    save(new_data)
  end

  def create_students
    students = []
    @data.each do |student|
      students << Student.new(student['age'], student['name'], student['parent_permission'])
    end
    students
  end
end
