class Course < ApplicationRecord
  has_many :course_relationships
  has_many :students, through: :course_relationships, source: :student 
end
