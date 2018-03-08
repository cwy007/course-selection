json.partial! "students/student", student: @student

json.courses @student.courses do |course|
  json.name course.name
  json.teacher course.teacher, :name
end
