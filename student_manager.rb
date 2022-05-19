require_relative 'filemanager'
require_relative 'student'

class StudentManager < FileManager
  def initialize
    super('data/students.json')
  end

  def save_student(student)
    @data << { id: student.id, age: student.age, name: student.name, parent_permission: student.parent_permission }
    save
  end

  def fetch_students
    students = []
    @data.each do |student|
      students << Student.new(student['age'], name: student['name'], parent_permission: student['parent_permission'],
                                              id: student['id'])
    end
    students
  end
end
