# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Student.delete_all
Teacher.delete_all
Course.delete_all
puts "clean database"

10.times do |i|
  student = Student.create(name: Faker::Name.name)
  5.times do
    teacher = Teacher.create(name: Faker::Name.name_with_middle)
    student.teachers << teacher
  end
  5.times do
    teacher = Teacher.all.sample
    course = teacher.courses.create(name: Faker::Name.name_with_middle)
    student.courses << course
  end
  print "*"
end

puts "\ncreate 10 students and create 5 teachers & 5 courses per student."
