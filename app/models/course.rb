#课程模型
class Course < ApplicationRecord
  #课程和分数 关联
  has_one :score
end
