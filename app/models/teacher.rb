class Teacher < ApplicationRecord
  #和学生的关联 ,has_many, 此处的  foreign_key 是student表的 teacher_id
  has_many :students, class_name: "Student", foreign_key: 'teacher_id', dependent: :destroy

  #关联 上级
  has_many :super_teacher_structure, class_name: 'TeacherStructure', foreign_key: 'teacher_id'
  #关联 有多少 下级
  has_many :lower_teacher_structure, class_name: 'TeacherStructure', foreign_key: 'super_id'

  #teacher表数据修改后,触发回调
  after_save :modify_user_status

  def modify_user_status
    #如果老师年龄大于60,他的所有学生状态修改不活跃
    if self.age > 60
      self.students.update_all(is_active: 2)
    end
  end

end
