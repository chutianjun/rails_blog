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

  #  第二题,添加show_name方法,如果数据库没有老师两个字,就在名称后加上 '老师' 两个字
  #  比如,如果是张三,就返回张三老师
  def show_name
    #如果最后两位不是老师 两个字 ,加上老师 两个字
    self.name += '老师' unless check_the_name_has_teacherstr?
    self.name
  end

  #检测名称最后 是否 有 老师 两个字
  def check_the_name_has_teacherstr?
    #如果 名字 最后 两位不是老师 两个字
    if self.name[-2..-1] != '老师'
      #先把字符串中 可能存在 其他地方 的老师 去掉
      self.name.gsub!('老师', '')
      return false
    end
    true
  end

end
