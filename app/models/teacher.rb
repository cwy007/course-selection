# == Schema Information
#
# Table name: teachers
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Teacher < ApplicationRecord
  has_many :teacher_relationships
  has_many :students, through: :teacher_relationships, source: :student
  has_many :courses, dependent: :destroy 
end
