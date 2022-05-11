#分数模型
class Score < ApplicationRecord
  #分数 和课程关联
  belongs_to :course
  #分数 和学生关联
  belongs_to :student
end
