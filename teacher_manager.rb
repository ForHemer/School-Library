require_relative 'filemanager'
require_relative 'teacher'

class TeacherManager < FileManager
  def initialize
    super('data/teachers.json')
  end

  def save_teacher(teacher)
    @data << { age: teacher.age, id: teacher.id, name: teacher.name, specialization: teacher.specialization }
    save
  end

  def fetch_teachers
    teachers = []
    @data.each do |teacher|
      teachers << Teacher.new(teacher['age'], teacher['name'], teacher['specialization'], id: teacher['id'])
    end
    teachers
  end
end
