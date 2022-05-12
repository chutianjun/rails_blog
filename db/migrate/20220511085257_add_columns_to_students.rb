class AddColumnsToStudents < ActiveRecord::Migration[6.1]
  def change
    #新增一个字段，学生的年龄
    add_column :students, :age, :boolean, limit: 3, comment: '学生年龄'
    #  老师的关联ID,严格上来说.学生和老师是属于多对多的,一个老师教多个学生,一个学生也有 多个老师 教, 还要建立一张 中间 表,我这里就 一个老师 对应 多个学生
    add_column :students, :teacher_id, :integer, comment: '老师ID,关联到teachers表'
  end
end
