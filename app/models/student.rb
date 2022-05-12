class Student < ApplicationRecord
  #校验年龄,必须为整数,不允许为负数
  validates :age, numericality: { greater_than: 0, message: "抱歉,年龄不能为负数" }

  #学生有多个分数
  has_many :scores, class_name: "Score"
  #查询年龄
  scope :query_age, ->(search_age) { where(age: search_age) }

  # 此处设置了从属关系 ,则 teacher_id 必须 有值,否则不允许 写入
  #
  # dependent 销毁后 如何处理关联对象,
  # 注意点:经过我测试, 如果 想要触发这个 关联 删除,必须 在调用删除方法的时候使用 destroy,destroy_all,destroy_by方法, 而 delete,delete_by,delete 不会触发回调
  #
  #   1.destroy时  删除 关联对象
  #   2.delete_all ,删除 关联对象(不执行回调)
  #   3.nullify,外键设置为null,(不执行回调)
  #
  belongs_to :teacher, class_name: 'Teacher', foreign_key: :teacher_id, dependent: :destroy

end
