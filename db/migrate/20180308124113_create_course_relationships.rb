class CreateCourseRelationships < ActiveRecord::Migration[5.1]
  def change
    create_table :course_relationships do |t|
      t.integer :student_id, index: true
      t.integer :course_id, index: true 

      t.timestamps
    end
  end
end
