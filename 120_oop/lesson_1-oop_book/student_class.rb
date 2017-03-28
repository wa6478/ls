class Student
  attr_reader :name
  def initialize(name, grade)
    @name = name
    @grade = grade
  end
  
  def better_grade_than?(other_student)
    grade >= other_student.grade
  end
  
  protected # like private this is a reserved word
  
  attr_reader :grade
end

bob = Student.new('Bob', 90)
sandy = Student.new('Sandy', 92)


puts bob.better_grade_than?(sandy)
puts sandy.better_grade_than?(bob)
puts bob.grade
puts sandy.grade