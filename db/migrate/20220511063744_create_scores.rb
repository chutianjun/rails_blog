class CreateScores < ActiveRecord::Migration[6.1]
  def change
    #分数表
    create_table :scores do |t|
      t.boolean :score, limit: 3, comment: '分数'
      t.integer :student_id, comment: '学生ID'
      t.string :course_id, comment: '课程ID'
      t.timestamps
    end
  end
end
