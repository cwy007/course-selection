class CreateTeacherRelationships < ActiveRecord::Migration[5.1]
  def change
    create_table :teacher_relationships do |t|
      t.integer :student_id, index: true 
      t.integer :teacher_id, index: true

      t.timestamps
    end
  end
end
