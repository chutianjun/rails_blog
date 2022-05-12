class TwoAddColumnsToStudents < ActiveRecord::Migration[6.1]
  def change
    add_column :students, :is_active, :boolean, limit: 3, comment: '是否活跃,活跃:1 不活跃:2,默认活跃', default: 1
  end
end
