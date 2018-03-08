# == Schema Information
#
# Table name: teacher_relationships
#
#  id         :integer          not null, primary key
#  student_id :integer
#  teacher_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_teacher_relationships_on_student_id  (student_id)
#  index_teacher_relationships_on_teacher_id  (teacher_id)
#

class TeacherRelationship < ApplicationRecord
  belongs_to :student
  belongs_to :teacher 
end
