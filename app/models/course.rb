# == Schema Information
#
# Table name: courses
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  teacher_id :integer
#
# Indexes
#
#  index_courses_on_teacher_id  (teacher_id)
#

class Course < ApplicationRecord
  has_many :course_relationships
  has_many :students, through: :course_relationships, source: :student
  belongs_to :teacher 
end
