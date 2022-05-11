class Student < ApplicationRecord
  #学生有多个分数
  has_many :scores, class_name: "Score"
end
