class CreateTeachers < ActiveRecord::Migration[6.1]
  def change
    create_table :teachers do |t|
      t.string :name, comment: '老师姓名'
      t.boolean :age, comment: '年龄', limit: 3
      t.text :description, comment: '描述'
      t.timestamps
    end
  end
end
