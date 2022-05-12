class CreateEmployees < ActiveRecord::Migration[6.1]
  def change
    #员工表
    create_table :employees do |t|
      t.string :name, limit: 50, comment: '员工姓名'
      t.integer :parent_id, comment: '上级ID', default: 0
      t.timestamps
    end
  end
end
