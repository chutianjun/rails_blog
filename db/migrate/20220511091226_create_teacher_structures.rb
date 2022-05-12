class CreateTeacherStructures < ActiveRecord::Migration[6.1]
  def change
    #老师结构表
    create_table :teacher_structures do |t|
      t.integer :teacher_id, comment: '老师ID'
      t.integer :super_id, comment: '上级ID'
      t.timestamps
    end
  end
end
