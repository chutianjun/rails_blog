class CreateCourses < ActiveRecord::Migration[6.1]
  def change
    #创建课程表
    create_table :courses do |t|
      t.string :course_name, limit: 50, comment: '课程名称'
      t.timestamps
    end
  end
end
