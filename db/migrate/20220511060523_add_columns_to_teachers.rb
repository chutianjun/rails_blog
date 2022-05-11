class AddColumnsToTeachers < ActiveRecord::Migration[6.1]
  def change
    #新增一个字段，用来标记是否空闲 is_free
    add_column :teachers, :is_free, :boolean, limit: 3, comment: '是否空闲'
  end
end
