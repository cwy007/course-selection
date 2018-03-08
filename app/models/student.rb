class Student < ApplicationRecord
  has_many :course_relationships
  has_many :courses, through: :course_relationships, source: :course
  has_many :teacher_relationships
  has_many :teachers, through: :teacher_relationships, source: :teacher 
end
