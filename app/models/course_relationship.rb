# == Schema Information
#
# Table name: course_relationships
#
#  id         :integer          not null, primary key
#  student_id :integer
#  course_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_course_relationships_on_course_id   (course_id)
#  index_course_relationships_on_student_id  (student_id)
#

class CourseRelationship < ApplicationRecord
  belongs_to :student
  belongs_to :course
end
