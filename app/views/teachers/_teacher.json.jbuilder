json.extract! teacher, :id, :name, :created_at, :updated_at
json.url teacher_url(teacher, format: :json)

json.courses teacher.courses do |course|
  json.extract! course, :id, :name, :created_at, :updated_at, :teacher_id
end
