class CreateStudents < ActiveRecord::Migration[6.1]
  def change
    create_table :students do |t|
      t.string :name, limit: 30, comment: '学生姓名'
      t.timestamps
    end
  end
end
