class Teacher < ApplicationRecord
  has_many :teacher_relationships
  has_many :students, through: :teacher_relationships, source: :student 
end
